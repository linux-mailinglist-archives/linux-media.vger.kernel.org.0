Return-Path: <linux-media+bounces-63545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oJIkK0TsH2rOsQAAu9opvQ
	(envelope-from <linux-media+bounces-63545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:56:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 43188635E74
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:56:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tomeuvizoso-net.20251104.gappssmtp.com header.s=20251104 header.b=xRhW72PA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63545-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63545-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B50F3300F768
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1823E409617;
	Wed,  3 Jun 2026 08:54:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E7423A7A
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 08:54:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476869; cv=pass; b=bV2N8f33fGn3HSIjlyHNKNn99kQHrfqB8yg0KyFI9WjYhvmTXZyrEtkoFO+dKmht3zcBEsQwiwRXQrfGaeXBE2deNgUgAQogBwCcCZoB3LR0bkg80gfFo9u2i2BuZtsbxSZT85pKHmwvI7jgkeUtN0AYccI2tY8ggy6uaPVIJLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476869; c=relaxed/simple;
	bh=LWdpnYx07T1Ms5zP1asG6Lruytmqf/Fa2t41ma/B4B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEV45eQLXt6/9EkZsoeHiy9kmKDreqwcs0UGHB97iHXs+2fs5dv3eCNeANw0REnCABbptSDtNB/7fUR0zNoxXaumOacbccmbeV3NWQ632C6nwu36bxoAhrnHKIDEQsfkGbkVboV7/2C7SybFQGp2FnYQ8rGDnQt5uXW3B5OpwqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b=xRhW72PA; arc=pass smtp.client-ip=209.85.222.180
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-915896efa02so56150385a.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 01:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780476865; cv=none;
        d=google.com; s=arc-20240605;
        b=eStSI3BKAD7kZtIwiDUjPvpIUwZ9likKRxSQLUZzig56tmgHqs0lOLA/EAVjBJt3I1
         +rI++YrLyEDIaz7vKqbIRG/P2q6zcYjmwgQJ1Jco0b/8DzaIk9PrQdv1IZ1t4ifM7Wsu
         L8hXsS28WpaVe3uxyaZCUVMqzYJCc2do3aSajKGLMhiTj580BLmPhL/rptx9LJUIvKcR
         Cq1JvChWh/7iv2ij1wSytN8H7pIC3EIGHDCcsqZ3YOymfOMjGuaL/8VhqpDpVMy5A/Id
         eCmesppA4DknIzzLK3PUj6osTuTZiH5WMlosqNfYSk3UtAJckSQNyjOOEZuKKO6stHrZ
         +prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g7JX48xUqE191PjwdvrWj7w+4oUCIR2hhRFUmFcQpEw=;
        fh=0KykHmsi4V5miHgUlpKYKyWGGXEK8Sq8fWacWSNbZ8U=;
        b=CU7VEIyluQBZALnhDJ+Je1tIhbAvKsAJkdbUdvGEIlZ5xTxN+GBR74mwfGreCz5lzT
         5YSL2JCAtfcG405rn0H37AYoeKOMPTTVvyxIwPES3zDfiB4eJpptXlgEUn0awbog+xso
         bgGEquZnDoa8wn32m/jzrKjXfkatABzluhsF8x312FbnTYeMX9eUlV2uhn1PQLzS5pUt
         8gZCd6QnXkuFUTroEKmttKkwUjFmjfbWmAsYolgm8y/EDPWP5QeD5LyaBXs+B7+pt8bt
         pBE0//jVIa8L53z2D0iG8AgaUrr5SYAZ0FpPAteXO6fecp8FF4W5c4wbk5Wkp+A5YxQS
         FtYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1780476865; x=1781081665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7JX48xUqE191PjwdvrWj7w+4oUCIR2hhRFUmFcQpEw=;
        b=xRhW72PAvG6tvAL6ohGjFciI5+ZBAhgCgN2KXtEAaVmnacTCWylLBn35aeFOejG6/N
         7GLp5ukhO4s6W7PSezQOF3eilmMUWZVNkilfOLnspccfDWK3P47XbJyUd1aXYf3I76GJ
         nRr+cguQselLCvxmhLtyXRKtXjA1leN+sKNxvkkatS/XsRCSp8iLjlX0NcJq1r3d9pyp
         AzT4/KAQfZ4cVTdRQyoE8gMV9Hfeeu4AeCKX3/1cEB4lmvyKR8cwLMdsWvDcQ58vb6pP
         qaN99bc1m6hzx0BdEQgMgTNwyJhP7tcznGvnkMQ+6mL27TeBy065OZ+6YF4SEUltz8zK
         dWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476865; x=1781081665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7JX48xUqE191PjwdvrWj7w+4oUCIR2hhRFUmFcQpEw=;
        b=fN9wHSiznc5mueZb0udQA4CTH91MB8oHa3UjC/SKIU2gi/XaQ+GzYDGh2qBi5RmQxO
         zLnTdOBInjDGjC63zLxQ9LMi5J0OdxWlHqasFcvqbXn0An6xnwNbeBo7zDVYaNmbH1CF
         pzADv9j7G08bEE/wyO7VOlv1zZfkFiCdhlvN6GOwBe4LEpyZ0qVemr56SsRLAK7BGS+1
         kX6v7bLJ9V/5fYFHVpyHUnOpdL413cPFf9oDKloCY3EF7QsbAIsnVFz2uB8L/MIlI8kX
         fWQos3YgKrQGNnLHAoG4EvNb/girwxFwFo/qibVAYE7a8XjpUzQzto8mhLywfRlzofpj
         pDDg==
X-Forwarded-Encrypted: i=1; AFNElJ8bdcw/hYRjkONZ8hGyIkFRlh3vJWr8+Gh8SKWEg79yPoMe2ETzlCxyHI3/t+z4B0iMQgqdSCBSIkzt4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQY2xkgpJ7lVkeT423/earGXU9riGykdzAPSHEVQx1LjQZVKdp
	U31ePcFebxfFMselfelBpWHOZGivUFgZbKm/CxiVpLcQwrO7E3nTYGKb/2fTTbjKr697Uzq0TZE
	wapRVdOzjsdZI4lwc3GJIARHYkOA012YHC0ucMsP3sA==
X-Gm-Gg: Acq92OG/s3HHvCMqSwFBSVH+akruxolmqMrTp8Hjm83FblZJDhAsCjRCi1QobgHyAMH
	5fjS/pxnCpz2yiW+oslk5zsCISqQhSjvaskKbFRQvK7g5jkn/ZZw6Hy+29yh6VHSqEgYBCoJ/JC
	IH2JbiXA+8ZEYyF0LGEqvC2ZOQRslUkDy38DRfYJDA/7a1CJNr+3Z2NLFH/rxqslLkBYIRfTR3B
	zclDQ7kbRfz/4kteJKeyWFGFbUc1hDIMK/GpOuQSPpLTMWD2oLmIwKJXGS9fKriBV53ZCsCiAXZ
	MsStL9Am44Zieqbq
X-Received: by 2002:a05:620a:470d:b0:914:e3dd:17fd with SMTP id
 af79cd13be357-9158a6cce06mr407596485a.6.1780476864872; Wed, 03 Jun 2026
 01:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com> <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
 <CAPsqS2Tt0JbHhJLHBsbJ2YfZW913WNfoSXpSa+8TD1T9CV8V3g@mail.gmail.com> <9879f670-8a23-407b-ab45-673904ad4a86@oss.qualcomm.com>
In-Reply-To: <9879f670-8a23-407b-ab45-673904ad4a86@oss.qualcomm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 3 Jun 2026 10:54:13 +0200
X-Gm-Features: AVHnY4JxR71JOH6mKjWdwqMelPGIBYkdeP3ekd-6Gg14JWpiLQqO3KnjrrlcThc
Message-ID: <CAPsqS2R5kr1-UqhijjgAfU9D1VnyEd3pCxOagHyesHSHpN4_8g@mail.gmail.com>
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bharath Kumar <quic_bkumar@quicinc.com>, Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[tomeuvizoso-net.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[tomeuvizoso.net];
	FORGED_SENDER(0.00)[tomeu@tomeuvizoso.net,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63545-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tomeuvizoso-net.20251104.gappssmtp.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomeu@tomeuvizoso.net,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,tomeuvizoso-net.20251104.gappssmtp.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43188635E74

On Wed, Jun 3, 2026 at 7:22=E2=80=AFAM Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
> On 20-05-2026 21:17, Tomeu Vizoso wrote:
> > On Wed, May 20, 2026 at 4:12=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wr=
ote:
> >>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>
> >>> Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
> >>> Documentation/accel/qda/. The documentation covers the driver
> >>> architecture, GEM-based buffer management, IOMMU context bank
> >>> isolation, and the RPMsg transport layer.
> >>>
> >>> The user-space API section describes the DRM IOCTLs for session
> >>> management, GEM buffer allocation, and remote procedure invocation vi=
a
> >>> the FastRPC protocol, along with a typical application lifecycle
> >>> example. Sections for dynamic debug and basic testing are also
> >>> included.
> >>>
> >>> Wire the new documentation into the Compute Accelerators index at
> >>> Documentation/accel/index.rst.
> >>>
> >>> Assisted-by: Claude:claude-4-6-sonnet
> >>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/accel/index.rst     |   1 +
> >>>  Documentation/accel/qda/index.rst |  13 ++++
> >>>  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++=
++++++++++
> >>>  3 files changed, 160 insertions(+)

<snip>

> >>> +Usage Example
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +A typical lifecycle for a user-space application:
> >>> +
> >>> +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
> >>> +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by tha=
t
> >>> +    device node.
> >>> +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``=
 to
> >>> +    establish a session and create a process context on the DSP.
> >>> +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or=
 import
> >>> +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_F=
D_TO_HANDLE``.
> >>> +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass argum=
ents and
> >>> +    execute functions on the DSP.
> >>> +5.  **Cleanup**: Close file descriptors to automatically release res=
ources and
> >>> +    detach the session.
> >>
> >> I'd have expected the description of the actual example. I.e. clone th=
e
> >> app from https://the.addr, prepare clang >=3D NN.MM, QAIC (https://foo=
),
> >> run make, run the app, check the results. I'd remind that DRM Accel ha=
s
> >> a very specific requirement of having the working toolhain in the
> >> open-source.
> >
> > We have been getting submissions lately that don't fulfill that
> > requirement so I will point to the precise part of the documentation
> > that explains it:
> >
> > https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-us=
erspace-requirements
> >
> > For an example of a submissions that complies, see:
> >
> > https://lore.kernel.org/dri-devel/20260114-thames-v2-0-e94a6636e050@tom=
euvizoso.net/
> >
> > Most importantly, notice how the proposed Thames Mesa driver generates
> > machine code for all the hardware units, and doesn't use any blob for
> > that.
> >
> I believe QDA checks all boxes for accel, as there is available
> opensource userspace, opensource QAIC compiler for IDL compilation and
> LLVM supports hexagon arch.

I must say that I'm at a total loss regarding the userspace portion of
this driver, despite spending half an hour looking inside the FastRPC
branch that you link from the cover letter.

Can you please explain what do people need to do to:

- run an algorithm of their choice on the DSP,
- execute inference with a common ML framework such as TensorFlow Lite
or PyTorch.

The documentation I pointed to earlier explains in length what is
expected from the userspace portion of the driver, which is more than
just being open source.

Thanks,

Tomeu

> I'll try adding these details as well.
>
> Thanks!> Regards,
> >
> > Tomeu
> >
> >>> +
> >>> +Internal Implementation
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >>> +
> >>> +Memory Management
> >>> +-----------------
> >>> +The driver's memory manager creates virtual "IOMMU devices" that map=
 to
> >>> +hardware context banks. This allows the driver to manage multiple is=
olated
> >>> +address spaces. The implementation uses a DMA-coherent backend to en=
sure data consistency
> >>> +between the CPU and DSP without manual cache maintenance in most cas=
es.
> >>
> >> GEM usage?
> >>
> >>> +
> >>> +Debugging
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +The driver includes extensive dynamic debug support. Enable it via t=
he
> >>> +kernel's dynamic debug control:
> >>> +
> >>> +.. code-block:: bash
> >>> +
> >>> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_d=
ebug/control
> >>> +
> >>> +Testing
> >>> +=3D=3D=3D=3D=3D=3D=3D
> >>> +The QDA driver can be exercised using the ``fastrpc_test`` utility f=
rom the
> >>> +FastRPC userspace library. Run the test application:
> >>
> >> pointer
> >>
> >>> +
> >>> +.. code-block:: bash
> >>> +
> >>> +    fastrpc_test -d 3 -U 1 -t linux -a v68
> >>> +
> >>> +**Options**
> >>> +
> >>> +``-d domain``
> >>> +    Select the DSP domain to run on:
> >>> +
> >>> +    * ``0`` =E2=80=94 ADSP
> >>> +    * ``1`` =E2=80=94 MDSP
> >>> +    * ``2`` =E2=80=94 SDSP
> >>> +    * ``3`` =E2=80=94 CDSP *(default on targets with CDSP)*
> >>> +
> >>> +``-U unsigned_PD``
> >>> +    Select signed or unsigned protection domain:
> >>> +
> >>> +    * ``0`` =E2=80=94 signed PD
> >>> +    * ``1`` =E2=80=94 unsigned PD *(default)*
> >>> +
> >>> +``-t target``
> >>> +    Target platform: ``android`` or ``linux`` *(default: linux)*
> >>> +
> >>> +``-a arch_version``
> >>> +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>

