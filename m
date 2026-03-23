Return-Path: <linux-media+bounces-56747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLhbM0FVwWlTSQQAu9opvQ
	(envelope-from <linux-media+bounces-56747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:59:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFDD2F592B
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AD8E302DE38
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32243AF668;
	Mon, 23 Mar 2026 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="eLtemJKK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605B5370D6E
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277767; cv=pass; b=OAK9vXGfOyFSwjeQjb2AbJEwnQ/ZbR5HuvG/CLxIRzCwKGvjKW1NK3mwMtDAGyuV1Cz8Ftt1948YSpCtm8XZy68Hbe9sSoe74RZ9Envvo7c/qZpi+DHTmQ47dD+GRtcQei53sxHuqFFHCs8apTxo79PD0awqcfNYJwMtzl0lr6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277767; c=relaxed/simple;
	bh=PIpaHtQhy1ct/zF6wlpA5f+6+Qs/Xy5/mHEvLvXsGt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sF2bKdT/3elYjToxOZ1grvxmBJ4qwL1eavJkZW+QU8rf+KdK/Cp9ex03QfKIeo9032bC+WcRYd+9iH4XbA9VmmBV3KfTSEIxpTehlU2GkQzTbtqsLrIaOb5NSjbgqzhcTAracJ+01xWqbRpkzeBc5FDxbTCcKLkt8a7ru9zacfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=eLtemJKK; arc=pass smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NE4i1R912162
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:56:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=/SbFMZE76p3gfmGbK12ObrHMOu+elkT4/3PXLPlFc6s=; b=eLtemJKK4Has
	CmgOJDrPyaoCnUKj/6m6pqv7c6rX5uKoNz278WPHV0NiaUJpobtYFO2c/H2u68V6
	rUcPfFnGGMkA1R9FznzGaso1EetXEsib33uPa8YS5DWKk/0H2+KRC5WmKpB4cexD
	WHP7rDQAp69Dwi6aLhiv0mxz/YtBATdPlBxZtCUbBSkgvz/ZWuCH7WY9e+9QunMn
	U71mnXfpBfmdW222Bg4EpE/mrvmdhA8ahhryGTBsBHhUVMfP+BPmcCKkhg/LGSi4
	aPVDqho1R8TPq9TMs70rd1fcR4pcGEwLRzN4l/Xx6Hgq2nJapc1J6r1TnayJIgy3
	wnJnWEn1Dw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4d1q5tsfy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:56:03 -0700 (PDT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40f192cf4b6so13321617fac.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774277763; cv=none;
        d=google.com; s=arc-20240605;
        b=aEdtC/4pkDjl4/kZ5nCz369k9DBkzxreilFX+hqvScGb9X1MaON4Q30CKK3GxPnfqQ
         SQFC58PWv7EHYJzotfsS1Hbl79y+kSW6unULQyWAnQLPX7KbF58y8qgOH7uFv6NXpflR
         in2v6r/OOibaLC0ANdiDvKrPO1z2ck/QVJE+tkWSYaZ8jCB9dlK0WEfbQPr2YMgzQX2o
         tlUo65R10W/NV1BAInnwHrcCZ03Mddmiia1dVGg3YSAu5OjsTab9KPffeZxCZmm+I6PH
         3CdiFbEeuAa6eF3t2pJzHEOVl6eahCpvG11tYl3EfPwwH9DLRPjozp3aIB9HQTWj7tGC
         X+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/SbFMZE76p3gfmGbK12ObrHMOu+elkT4/3PXLPlFc6s=;
        fh=Pv1MjYTNFPuZySUr6rfQxizCE2PP19nK+LjtCKsAD6A=;
        b=BIBkmdS+OFQMat/x4qH5rC8OLupjKmRiQwy5VXrAHTH+EjFKXneBJ5Lu288mGKcjzx
         e1bl3oZJy3Yi+WvUNl7f5B6MOyrcDl1lGHQPBqGRfCObY57FtvXnFy02FrpLJJrfh/pP
         VsXa+qhm6GYwNpzL95sLB6pT5atgQsB1MPhYVrxlFpwbH5Qr+zkyzwJ/IlEaNhy7r3Jg
         AXEzOkv57Yb47XK+GXAo29kPwadA3M95+kOOh+2WnIrBEbZK8GppAS+INe4HvroUJB91
         SeOR9reTjniTT9dyzvCa960zjiGfH+rpfA4xc3QKTuKZe3cFc31hh9hBWgyKQnPK61Hv
         lGvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277763; x=1774882563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/SbFMZE76p3gfmGbK12ObrHMOu+elkT4/3PXLPlFc6s=;
        b=e0nk8Doh/DvLm+tUA+EpB4QzZEQmoNaglXRFYoLYQb3MhhCOKwi0rLyFabYUbhsbMC
         Wt/nAolqIhMYhYFINbXPk1ix5ZlPY0xvsV0H/hYSi52i6O/OrpPKcuwFQeacx2S9gDhq
         y+6LBO80o5GKKrmRcF5gvFpmX+jtkBbKzE3TmmXxLA8UUUymXR2UKBFXikqUUEN2FTZK
         7aQppXmoqYNI5Y0eXO3U3bSkV2Ia1dz51jGg6NN8XfiqO9syVZHvuZoCBQhZvLwSqUjX
         SX7qcCgjZX/LVCFx3tYhP9dO11Nl/Yh/rQBLKKBrgirqHq+p3jBdhpPNCzXcGYdtw1E6
         gazg==
X-Forwarded-Encrypted: i=1; AJvYcCUxo1UgjEOINiPxKk1GoswO3D+fqNaMEVvAlrytbGcucIigbCLdZqT/xgPwaaAJp/hw+nMKTiV+Ww8bsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt0phPZLQ1QHT9u3KIM0tL08Q3939BRZoHQr7LKpHSU9smzyGb
	MHN/kkTIzgQuO+hDV5Y9/1OQ377d2IFnqyyvSv7ZdfAGPhmHNyCdLXMCj+Pac+TyV8Z2de/xV8Y
	I8zTLX9RkT2AvUx0uSLAUwIcJ63iOdtlAV3TlAcpEFnn3A1Fl2IlPmDgp1qnP3PQvz3gKG+jJhQ
	QF84720aw9qggEh+7r9cVMWWlhig1j8CO1YifHVA==
X-Gm-Gg: ATEYQzyzAGNILGCJifjQr23Es8PVTTDk3erB53HVUnnBi8IwyS6o8UBw/mPKR+CpWux
	MTdEH+5Sj2Yym5AqaI4I25CChLeswJ/wFPVZMgh1s3AULq6YOXkdsAjAGvYxAWaXI8LBW+Fs+WE
	joaVmnTbVadnpLOgIjrhgaOjiEolpyajtkA0w+2G/fI7bFmYgJmXjLxxDr+wCVDRamF/8VEyWOS
	r+I2QnFbJbNtIOdoAFuYQ==
X-Received: by 2002:a05:6870:d694:b0:409:77a9:f951 with SMTP id 586e51a60fabf-41c10eff3demr8063004fac.11.1774277762618;
        Mon, 23 Mar 2026 07:56:02 -0700 (PDT)
X-Received: by 2002:a05:6870:d694:b0:409:77a9:f951 with SMTP id
 586e51a60fabf-41c10eff3demr8062984fac.11.1774277762035; Mon, 23 Mar 2026
 07:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312184613.3710705-1-mattev@meta.com> <20260312184613.3710705-5-mattev@meta.com>
 <20260318140408.4677fff5@shazbot.org>
In-Reply-To: <20260318140408.4677fff5@shazbot.org>
From: Matt Evans <mattev@meta.com>
Date: Mon, 23 Mar 2026 14:55:51 +0000
X-Gm-Features: AaiRm53cK7A_m0KWvttAGgjGrqlnTSfUkM-9VEpOFaKWwlBtmEfLrXJeDgr0v_M
Message-ID: <CAFzAbJGdYpaw0rAwLxLqqzzUiaPjySLXYsnS+hWwF4-GkBmgyQ@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 04/10] vfio/pci: Add a helper to create a DMABUF
 for a BAR-map VMA
To: Alex Williamson <alex@shazbot.org>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
        Alex Mastro <amastro@fb.com>, Mahmoud Adam <mngyadam@amazon.de>,
        David Matlack <dmatlack@google.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple <apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: MLu4il9FssoZVj-e4Gq6I63bdPvKAXAX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExNSBTYWx0ZWRfX9bgKMCBJ8juz
 UbLJYW6zuikLFPO2+rcec9pblT767hnq/JDApeqL5odRoWfcfEAw8iEzIR92J0uIe3makpPTJVL
 tb5T4z5A4p67zMlVQm3uriFsN2hBW+LowqyUItzkGiNqygAU7mEXvAiCmCLME0FA/uZatjXzI4a
 HEd769/RwBFIRofR8GCWH4aQHRknj6jNihHzhbsOqIhu07m52Qk/P/8TjRURedeRdUB4g509vgh
 ARLz8/JVkdK/CJEj7CDzmC7JOb1ZkBHFHoiV+EzRZ0v26RO4x+h8hfyUhziSG2KRDnInKLlZaUz
 R/CpgH/Fx8L3wRymtmtpElIIcX33GJ6sb7CRyJwaf71FDpuUkjQS8JFkINgEB2HDjF8HaC2YBSV
 ZerPIaXr1Trvm663oZs+zEhL5Qb9zzLoNa6/XnitTf9AhjtOko+POGTtLC7NwivYdPSYkXVXBuy
 zc/zFp7MwcLihJ+3Ybg==
X-Authority-Analysis: v=2.4 cv=TpvrRTXh c=1 sm=1 tr=0 ts=69c15483 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=Dv35txUGz5gI0hTa:21 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=r1p2_3pzAAAA:8 a=VabnemYjAAAA:8
 a=cHgMKt-ThCp0vrf1_T8A:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=r_pkcD-q9-ctt7trBg_g:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: MLu4il9FssoZVj-e4Gq6I63bdPvKAXAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-56747-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[meta.com:+]
X-Rspamd-Queue-Id: 8EFDD2F592B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alex,

On Wed, Mar 18, 2026 at 8:04=E2=80=AFPM Alex Williamson <alex@shazbot.org> =
wrote:
> On Thu, 12 Mar 2026 11:46:02 -0700
> Matt Evans <mattev@meta.com> wrote:
>
> > This helper, vfio_pci_core_mmap_prep_dmabuf(), creates a single-range
> > DMABUF for the purpose of mapping a PCI BAR.  This is used in a future
> > commit by VFIO's ordinary mmap() path.
> >
> > This function transfers ownership of the VFIO device fd to the
> > DMABUF, which fput()s when it's released.
> >
> > Refactor the existing vfio_pci_core_feature_dma_buf() to split out
> > export code common to the two paths, VFIO_DEVICE_FEATURE_DMA_BUF and
> > this new VFIO_BAR mmap().
> >
> > Signed-off-by: Matt Evans <mattev@meta.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 131 +++++++++++++++++++++--------
> >  drivers/vfio/pci/vfio_pci_priv.h   |   4 +
> >  2 files changed, 102 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio=
_pci_dmabuf.c
> > index 63140528dbea..76db340ba592 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > @@ -82,6 +82,8 @@ static void vfio_pci_dma_buf_release(struct dma_buf *=
dmabuf)
> >               up_write(&priv->vdev->memory_lock);
> >               vfio_device_put_registration(&priv->vdev->vdev);
> >       }
> > +     if (priv->vfile)
> > +             fput(priv->vfile);
> >       kfree(priv->phys_vec);
> >       kfree(priv);
> >  }
> > @@ -182,6 +184,41 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_=
buf *vpdmabuf,
> >       return -EFAULT;
> >  }
> >
> > +static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
> > +                               struct vfio_pci_dma_buf *priv, uint32_t=
 flags,
> > +                               size_t size, bool status_ok)
> > +{
> > +     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +
> > +     if (!vfio_device_try_get_registration(&vdev->vdev))
> > +             return -ENODEV;
> > +
> > +     exp_info.ops =3D &vfio_pci_dmabuf_ops;
> > +     exp_info.size =3D size;
> > +     exp_info.flags =3D flags;
> > +     exp_info.priv =3D priv;
> > +
> > +     priv->dmabuf =3D dma_buf_export(&exp_info);
> > +     if (IS_ERR(priv->dmabuf)) {
> > +             vfio_device_put_registration(&vdev->vdev);
> > +             return PTR_ERR(priv->dmabuf);
> > +     }
> > +
> > +     kref_init(&priv->kref);
> > +     init_completion(&priv->comp);
> > +
> > +     /* dma_buf_put() now frees priv */
> > +     INIT_LIST_HEAD(&priv->dmabufs_elm);
> > +     down_write(&vdev->memory_lock);
> > +     dma_resv_lock(priv->dmabuf->resv, NULL);
> > +     priv->revoked =3D !status_ok;
>
> Testing __vfio_pci_memory_enabled() outside of memory_lock() is
> invalid, so passing it as a parameter outside of the semaphore is
> invalid.  @status_ok is stale here.

So it is, arrrrrgh.  Thank you for that; I've found a couple of other
choice bugs in that RFC, and will resolve all of this in a repost
soon.

[snip]
> > +
> > +     /*
> > +      * The VMA gets the DMABUF file so that other users can locate
> > +      * the DMABUF via a VA.  Ownership of the original VFIO device
> > +      * file being mmap()ed transfers to priv, and is put when the
> > +      * DMABUF is released.
> > +      */
> > +     priv->vfile =3D vma->vm_file;
> > +     vma->vm_file =3D priv->dmabuf->file;
>
> AIUI, this affects what the user sees in /proc/<pid>/maps, right?
> Previously a memory range could be clearly associated with a specific
> vfio device, now, only for vfio-pci devices, I think the range is
> associated to a nondescript dmabuf.  If so, is that an acceptable, user
> visible, debugging friendly change (ex. lsof)?  Thanks,

(Jason, your comment noted with thanks, replying to you both here to
save electrons.)

Great question; a formatting change there is inherent to moving to a
DMABUF (which generates a "/dmabuf:" prefix to a user-defined name).
If we can accept that it changes at all, then I agree this then should
output nice debug: at least the cdev name and resource index, and
we've the opportunity to include the BDF too.  I've added this; an
example line of /proc/<pid>/maps:

    ffffb8070000-ffffbc040000 rw-s 00030000 00:0b 5
      /dmabuf:vfio0:0000:00:03.0/1

Note the file offset used to include the resource index up at
VFIO_PCI_OFFSET_SHIFT but this DMABUF version doesn't do that, so I'm
proposing appending a "/%u" for the index.  Above is a map of BAR1,
offset 0x30000.  If people feel strongly about the existing aesthetic
then we could keep the index encoded in vm_pgoff to retain the same
offset field in /proc/<pid>/maps, but it'd be less neat masking it
back out in a few places.

The default name of a DMABUF acquired through
VFIO_DEVICE_FEATURE_DMA_BUF would still be "/dmabuf:" and I think it
should stay this way since a better name should be supplied by
userspace.  The default at least differentiates them from VFIO device
fd mappings.

Many thanks,


Matt


>
> Alex
>
> > +     vma->vm_private_data =3D priv;
> > +
> > +     return 0;
> > +
> > +err_free_phys:
> > +     kfree(priv->phys_vec);
> > +err_free_priv:
> > +     kfree(priv);
> > +     return ret;
> > +}
> > +
> >  void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool rev=
oked)
> >  {
> >       struct vfio_pci_dma_buf *priv;
> > diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_p=
ci_priv.h
> > index 5cc8c85a2153..5fd3a6e00a0e 100644
> > --- a/drivers/vfio/pci/vfio_pci_priv.h
> > +++ b/drivers/vfio/pci/vfio_pci_priv.h
> > @@ -30,6 +30,7 @@ struct vfio_pci_dma_buf {
> >       size_t size;
> >       struct phys_vec *phys_vec;
> >       struct p2pdma_provider *provider;
> > +     struct file *vfile;
> >       u32 nr_ranges;
> >       struct kref kref;
> >       struct completion comp;
> > @@ -128,6 +129,9 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_b=
uf *vpdmabuf,
> >                             unsigned long address,
> >                             unsigned int order,
> >                             unsigned long *out_pfn);
> > +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
> > +                                struct vm_area_struct *vma,
> > +                                u64 phys_start, u64 pgoff, u64 req_len=
);
> >
> >  #ifdef CONFIG_VFIO_PCI_DMABUF
> >  int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u=
32 flags,
>

