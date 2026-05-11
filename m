Return-Path: <linux-media+bounces-61037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0uQEEFYeAWrLQwEAu9opvQ
	(envelope-from <linux-media+bounces-61037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 02:09:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D6506E1B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 02:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10969300D94B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 00:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425DA1DFF0;
	Mon, 11 May 2026 00:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8AAWJeg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BE54A35
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 00:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778458192; cv=pass; b=qrFu/KY5LDVtsS1fdaLUME7ICAwoRINg2meKhL7cg3gdpomvVnyRNicByIXxL5UknRi/zbxBkBDPKaIuBuhizt18GtX8BKqqqt/pIKOd4n1NfUWrllxsycPvkWOH5WvsGhFEbDKXT6VacBS06f3mriUepLvAdGAb9G9nnFw7OX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778458192; c=relaxed/simple;
	bh=+DV2Pbryn5AcuySZjWxSj53srMkIzs/9FYbKOyGHdVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyHvek91idrfm1PkZGNMEpRu33bDPDUj1Dp81UJS7d09Xea5mdbRNmydmXEPi/erdaxHhSN+XIV/CU9GWMeUTsTt4SDO4lxw1jBOwBoISn2yhY0gzYejhZo8BP29rXl/jm4rkiFcDzRqT8Q47EQIW1qO7VpOvsHO20wxuQI2a4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8AAWJeg; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12e332315a8so8174472c88.0
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 17:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778458190; cv=none;
        d=google.com; s=arc-20240605;
        b=DeCk5bDTUkNtAShVoGyTJMeB50k6HZShtpdfp1m+Tvqg9HbYQluMY5Xv/nHTPg8Mpo
         dDGhoUyGz5rjLWW0+3SOmLGSenFDEctuahrSSeIlMmqdvlraiNEW1Au8Rp4xZngHFneX
         2JJSFYKUxfdXSIn2lm+hxuZp+wnF4whxOJmLVyro8WEK/tH6nZOTe/Wm9agus2pNMUzC
         0spqn36zIwEy4q/mxsBrW0wU3Rda91lbj5UyNDWy0wRYoKAG1rxdQdFDjVNgiLh4qoX4
         e5k8/ep1uUlWAvg9WLDaJYimIfcOKuIXZzQL/v39KmLeJ7cFTR2pnixuF8g4b8wRyYb1
         njhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u07m9yuqsRLpUl3uxq42CCFFR5vP/PCNV+X43wCzRw4=;
        fh=mP/7dyiqepcZjepqwJFWH/ELp6oXhPGDrijlVOuhpCA=;
        b=F9KQgwiGKK7rG2VLnYZf0aafBsUj2ZFrjW9J2RWGiU035gIStGcQr6+NzkB38/5PBD
         i9nkEdFDwG94ZmQ1mW2RE2tF+9jhY1wyae9BeNypOg/XrTA5GNw4A0KWI/9aCV/lzzOY
         ZpBnXIBXYRjuoHM3ZP4Mrm1iXWW50JBurPqpx02C7W5/XoHBecyARHmCz5vH3wBvyzmm
         84MFw4jYTWk/bNKKVZFFT1CqTuaw1ZScdZyrNv2SBO8Bjyqf957J6H86dtA082WQRhuV
         kvjJpeGkkf2zZgQOxi0S7V5LUUBs0vxUKJgFjRrv3wPRq9VlpHQS4mR+zoxBjqzhwi2B
         /v6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778458190; x=1779062990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u07m9yuqsRLpUl3uxq42CCFFR5vP/PCNV+X43wCzRw4=;
        b=n8AAWJegYj3j82LBkNgD3Veyrby9dM6JQQ9Ycn+4WgERcOxdJq/tBSO3lLbOv5FeOt
         +3sby0pPi3WtgnRgLAQGz0obDNNdYBZ1vo/HgjHdTWtEy+XHbyUET1FLj58lnnZypZfP
         tZJxxGN0yIOmYLAcYOna/4QFOk4/KD8DitifeOqjtRu/zTELnNSx6RBj4Fw0YuLeOpqy
         KID0PJWzexEQeLEjmic5sH5ktZWAQQvkbCHqzpvr/yd1PENJG8M5uqywO6kCQwlqACQz
         pq2JONxLXwtiYcC8n/GvyhbXMuw28JdeaE7d+SKvDJzphqsFbQ3lhP+hwGqxA9rXuUKj
         kD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778458190; x=1779062990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u07m9yuqsRLpUl3uxq42CCFFR5vP/PCNV+X43wCzRw4=;
        b=r0yxE6vbdB+SgHBmT/Rc1e2luq6pdXKch1duDSegFmtdvAUlkFQ2uxPc4YhbovZLx9
         qkAqbGqYG/jFAill2Byi/IWYtqr4CIyYVkY4pFa9e2bKGOV/QLSmLVhVABzShCvNKwqP
         CY3rBNSsmFgvVcZfJ7Sv96lerwB+YBgocXyPRgOSef1y9/eYGY3mHXqJeHbX5Y/yDzp7
         VfHe+TYHiqVGBeipFTmoqkig+XA0TUu7bbFVxTeTPYB4dyhgJOYz2hILlyaRWKQ89svg
         hnt1oD9G+cjR8MucKS1XsYUSvXcz+7gthLU4UQomHLYm38dzaVTDRDDuNSYyIBbQJ+5m
         Oang==
X-Gm-Message-State: AOJu0Yw/M+ZcYCtIfuBeVTgPT0daHtVDDQrYQlm3m+b3ZwGqGLcRVfap
	ytplSDO8DppcspclJiniqpzh0FsrpHNVX6NKo2SoRnHXb5tvzhbVjGcEr7pECH4prZ7GSTDgoW6
	urK29Qp3fp+N9Y9by+cN9Ghee1xzBtZ4=
X-Gm-Gg: Acq92OHrJkl5LgqXti2PdaVT9xhMqwMU9eC86o+l5MG129wAKwz0IeRgnc8pwNPVhdC
	OmojsBNN1ekqGDdmjROVkE81f7Z1DuKYL+gUmVtkktpMslNrbV/4Se6vO8g5ibTlRBmyb6V7wM5
	LG52fqNRAbrJWCj36j7aDdpUhoL3CLyhnCfq/0nmwwTqpEMWNzZ0AQzGzzCwvEGUGLVcksQ09aJ
	XLw6JBVx9UFw+FJFCcJ1VDKLVzeQ/LD65lXVOTQIVfjk5dpUe0n/uoBoHbkZE4u5a7IzSwz4jCK
	PA9NkfuPu0/ZqcIW
X-Received: by 2002:a05:7022:b87:b0:128:cedb:33c6 with SMTP id
 a92af1059eb24-132a7aef269mr3774845c88.16.1778458189905; Sun, 10 May 2026
 17:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330233636.381969-1-hoff.benjamin.k@gmail.com>
 <20260403135709.46163-1-hoff.benjamin.k@gmail.com> <336b8ec9-f3e3-4850-9261-752392a898ac@kernel.org>
 <CAMSzxxSt5JsV3_4V-R=zQc3Zck-3u8MiJgKq6fmFWm26kp+6Jg@mail.gmail.com> <0e668d98-9a7b-4422-86cf-8f9163d768d0@kernel.org>
In-Reply-To: <0e668d98-9a7b-4422-86cf-8f9163d768d0@kernel.org>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Sun, 10 May 2026 20:09:35 -0400
X-Gm-Features: AVHnY4IlHdBKCcYw3_9OFRAVTfgua4wJN_qfpAuB5TSQf4Rqk1qLM-PAWNhjYSk
Message-ID: <CAMSzxxTmO+ssb9J_k7bQCDCvazMBfvUXDhpkkuAFfi2atZE4eg@mail.gmail.com>
Subject: Re: [PATCH v5] media: pci: add AVMatrix HWS capture driver
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 816D6506E1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61037-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Hans,

I ran the  v4l2-compliance from the repo and posted the output as part
of the newest patch here:
https://patchwork.linuxtv.org/project/linux-media/patch/20260510235037.2487=
6-1-hoff.benjamin.k@gmail.com/

The results are also here for ease:
48 tests succeeded, 0 failed, 1 warning

I also realized that when preparing v6, I hadn=E2=80=99t copied the latest
changes from my standalone repo into the Linux tree correctly.
To avoid that happening again, I added a small script that compares
the driver files byte-for-byte between the two trees before sending
the patch.

Thanks again for the review. I appreciate it.
-Ben


On Thu, May 7, 2026 at 1:10=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel.=
org> wrote:
>
> On 06/05/2026 21:43, Ben Hoff wrote:
> > Hi Hans,
> >
> > Thanks for the review.
> >
> > I posted an updated version here:
> >
> > https://patchwork.linuxtv.org/project/linux-media/patch/20260506192618.=
35384-1-hoff.benjamin.k@gmail.com/
> > This version removes the unnecessary `(void)` casts and fixes
> > the`sizeimage` handling in `queue_setup()`.
> >
> > `queue_setup()` no longer tries to rebuild `vid->pix.sizeimage` on the
> > fly. The driver initializes the default format state during channel
> > setup, and format/timing changes update `vid->pix.sizeimage` through
> > `hws_calc_sizeimage()` before the queue is used.
> >
> > I also removed the inconsistent `PAGE_ALIGN()` handling from
> > `queue_setup()`. The requested plane size is now checked against
> > `vid->pix.sizeimage`, and new buffers are sized to that same logical
> > V4L2 `sizeimage` value. If the hardware path later needs additional
> > padding, then that should be reflected in `pix.sizeimage` itself. This
> > behavior is consistent with the original driver.
> >
> > Not sure where that crept in, but I had multiple allocation paths in
> > this driver at one point that I consolidated down for ease of
> > maintaining, so guessing during that shuffle.
> >
> > Finally, `alloc_sizeimage` was only used as a debug/accounting value,
> > so I removed it entirely.
> >
> > Thanks again for catching this.
>
> Thank you for the quick turnaround.
>
> I hope to review v6 soon (hopefully early next week), so unless I find so=
mething
> else I should be able to merge it for v7.2.
>
> One request: can you do another run with v4l2-compliance and post the out=
put?
>
> If possible, please compile v4l2-compliance from the git repository (git:=
//linuxtv.org/v4l-utils.git)
> so you test with the latest version.
>
> Regards,
>
>         Hans
>
> >
> > Best,
> > Ben
> >
> > On Tue, May 5, 2026 at 6:37=E2=80=AFAM Hans Verkuil <hverkuil+cisco@ker=
nel.org> wrote:
> >>
> >> Hi Ben,
> >>
> >> While reviewing v5 I discovered some issues, one of them (sizeimage ha=
ndling)
> >> important enough to warrant a v6.
> >>
> >> On 4/3/26 15:57, hoff.benjamin.k@gmail.com wrote:
> >>> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> >>>
> >>> Add an in-tree AVMatrix HWS PCIe capture driver. The driver supports
> >>> up to four HDMI inputs and exposes the video capture path through
> >>> V4L2 with vb2-dma-contig streaming, DV timings, and per-input
> >>> controls. Audio support is intentionally omitted from this
> >>> submission.
> >>>
> >>> This patch also adds the MAINTAINERS entry for the new driver.
> >>>
> >>> This driver is derived from a GPL out-of-tree driver.
> >>>
> >>> Changes since v4:
> >>> - replace plain 64-bit elapsed-time divisions in debug logging with
> >>>   div_u64() so i386 module builds do not emit __udivdi3 references
> >>>
> >>> Changes since v3:
> >>> - fold the MAINTAINERS update into this patch so per-patch CI sees th=
e
> >>>   new file pattern
> >>> - wrap the validation text for checkpatch
> >>>
> >>> Changes since v2:
> >>> - keep scratch DMA allocation on a single probe-owned path
> >>> - avoid double-freeing V4L2 control handlers on register unwind
> >>> - drop the extra per-node resolution sysfs ABI
> >>> - turn live geometry changes into explicit SOURCE_CHANGE renegotiatio=
n
> >>> - report live DV timings and reject attempts to retime a live source
> >>> - stop advertising RESOLUTION source changes for fps-only updates
> >>> - keep live fps state across harmless S_FMT restarts
> >>> - stop exposing an unvalidated DV RX power-present signal
> >>> - clean the imported sources for checkpatch and W=3D1 builds
> >>>
> >>> Validation:
> >>> - build-tested with W=3D1 against a local kernel build tree
> >>> - compiled the driver with ARCH=3Di386 allmodconfig and verified the
> >>>   resulting hws_pci.o, hws_video.o, and hws.o do not reference
> >>>   __udivdi3
> >>> - v4l2-compliance 1.32.0 on /dev/video1: 51 tests succeeded,
> >>>   0 failed, 1 warning
> >>>
> >>> DV_RX_POWER_PRESENT is intentionally left unsupported in this revisio=
n
> >>> because current hardware evidence does not expose a validated
> >>> receiver-side power-detect signal distinct from active video presence=
.
> >>>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Closes: https://lore.kernel.org/oe-kbuild-all/202604020522.z22eZuW8-l=
kp@intel.com/
> >>> Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> >>> ---
> >>>  MAINTAINERS                            |    6 +
> >>>  drivers/media/pci/Kconfig              |    1 +
> >>>  drivers/media/pci/Makefile             |    1 +
> >>>  drivers/media/pci/hws/Kconfig          |   12 +
> >>>  drivers/media/pci/hws/Makefile         |    4 +
> >>>  drivers/media/pci/hws/hws.h            |  174 +++
> >>>  drivers/media/pci/hws/hws_irq.c        |  271 +++++
> >>>  drivers/media/pci/hws/hws_irq.h        |   10 +
> >>>  drivers/media/pci/hws/hws_pci.c        |  865 ++++++++++++++
> >>>  drivers/media/pci/hws/hws_reg.h        |  136 +++
> >>>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  924 +++++++++++++++
> >>>  drivers/media/pci/hws/hws_v4l2_ioctl.h |   36 +
> >>>  drivers/media/pci/hws/hws_video.c      | 1506 ++++++++++++++++++++++=
++
> >>>  drivers/media/pci/hws/hws_video.h      |   29 +
> >>>  14 files changed, 3975 insertions(+)
> >>>  create mode 100644 drivers/media/pci/hws/Kconfig
> >>>  create mode 100644 drivers/media/pci/hws/Makefile
> >>>  create mode 100644 drivers/media/pci/hws/hws.h
> >>>  create mode 100644 drivers/media/pci/hws/hws_irq.c
> >>>  create mode 100644 drivers/media/pci/hws/hws_irq.h
> >>>  create mode 100644 drivers/media/pci/hws/hws_pci.c
> >>>  create mode 100644 drivers/media/pci/hws/hws_reg.h
> >>>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
> >>>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
> >>>  create mode 100644 drivers/media/pci/hws/hws_video.c
> >>>  create mode 100644 drivers/media/pci/hws/hws_video.h
> >>>
> >>
> >> <snip>
> >>
> >>> diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/p=
ci/hws/hws_v4l2_ioctl.c
> >>> new file mode 100644
> >>> index 000000000000..9c0826c0f9f9
> >>> --- /dev/null
> >>> +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
> >>> @@ -0,0 +1,924 @@
> >>
> >> <snip>
> >>
> >>> +/* Query the *current detected* DV timings on the input.
> >>> + * If you have a real hardware detector, call it here; otherwise we
> >>> + * derive from the cached pix state and map to the closest supported=
 DV mode.
> >>> + */
> >>> +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> >>> +                             struct v4l2_dv_timings *timings)
> >>> +{
> >>> +     struct hws_video *vid =3D video_drvdata(file);
> >>> +     u32 w, h;
> >>> +     u32 fps;
> >>> +     bool interlace;
> >>> +
> >>> +     if (!timings)
> >>> +             return -EINVAL;
> >>> +
> >>> +     w =3D vid->pix.width;
> >>> +     h =3D vid->pix.height;
> >>> +     interlace =3D vid->pix.interlaced;
> >>> +     (void)hws_get_live_dv_geometry(vid, &w, &h, &interlace);
> >>
> >> No need to cast to (void). I've seen it several times in this patch, j=
ust drop it.
> >>
> >>> +     fps =3D hws_get_live_fps(vid);
> >>> +     if (!fps)
> >>> +             fps =3D vid->current_fps ? vid->current_fps :
> >>> +                   hws_pick_fps_from_mode(w, h, interlace);
> >>> +
> >>> +     return hws_fill_dv_timings(w, h, interlace, fps, timings);
> >>> +}
> >>
> >> <snip>
> >>
> >>> diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hw=
s/hws_video.c
> >>> new file mode 100644
> >>> index 000000000000..9c81af6e7d7f
> >>> --- /dev/null
> >>> +++ b/drivers/media/pci/hws/hws_video.c
> >>> @@ -0,0 +1,1506 @@
> >>
> >> <snip>
> >>
> >>> +static int hws_queue_setup(struct vb2_queue *q, unsigned int *num_bu=
ffers,
> >>> +                        unsigned int *nplanes, unsigned int sizes[],
> >>> +                        struct device *alloc_devs[])
> >>> +{
> >>> +     struct hws_video *vid =3D q->drv_priv;
> >>> +
> >>> +     (void)num_buffers;
> >>> +     (void)alloc_devs;
> >>
> >> This shouldn't be needed.
> >>
> >>> +
> >>> +     if (!vid->pix.sizeimage) {
> >>
> >> Why would this ever be 0? At probe time this should be set to somethin=
g
> >> sane.
> >>
> >>> +             vid->pix.bytesperline =3D ALIGN(vid->pix.width * 2, 64)=
;
> >>
> >> Apparently vid->pix.width/height are valid (non-0), so why would sizei=
mage
> >> be 0? vid->pix should always have sane consistent data.
> >>
> >>> +             vid->pix.sizeimage =3D vid->pix.bytesperline * vid->pix=
.height;
> >>> +     }
> >>> +     if (*nplanes) {
> >>> +             if (sizes[0] < vid->pix.sizeimage)
> >>
> >> If PAGE_ALIGN is used below, then it should also be used here.
> >> This can cause memory overwrite if you pass a buffer with VIDIOC_CREAT=
EBUF
> >> that is of size 'sizeimage' when it should be 'PAGE_ALIGN(sizeimage)'.
> >>
> >>> +                     return -EINVAL;
> >>> +     } else {
> >>> +             *nplanes =3D 1;
> >>> +             sizes[0] =3D PAGE_ALIGN(vid->pix.sizeimage);
> >>
> >> But if you need PAGE_ALIGN, why isn't vid->pix.sizeimage set with PAGE=
_ALIGN
> >> in the first place?
> >>
> >>> +     }
> >>> +
> >>> +     vid->alloc_sizeimage =3D PAGE_ALIGN(vid->pix.sizeimage);
> >>
> >> What is alloc_sizeimage used for? I see it used only in a v4l2_dbg mes=
sage.
> >>
> >>> +     return 0;
> >>> +}
> >> Regards,
> >>
> >>         Hans
> >
>

