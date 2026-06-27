Return-Path: <linux-media+bounces-65796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jgtHHO+vP2rGWwkAu9opvQ
	(envelope-from <linux-media+bounces-65796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:11:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D56D1D10
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:11:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KXduEwcq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65796-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65796-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E726E300A26F
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 11:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FD53ACA5A;
	Sat, 27 Jun 2026 11:11:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58673590C3
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 11:11:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782558694; cv=pass; b=GXPJXl6zwqserwWcgbJRdnfoVtXxK+bk5/4x6VvIS9mU+Nni3otDZqZB+8JY+UjNpkrFTG13PG1M/SuomHinRQM7QonsuXLvgY1Y6Snmtvk+nhiQoGRLoGS+b+8Zl1CzlVjj84pahD7Msus3M+MXGPKIR0vSHKViJpkwCEIQrCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782558694; c=relaxed/simple;
	bh=5pbH+F2fthrPc91zP5j8NRZtfQ2bq3zTyuwBi/QDHi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ln6hgGx/5USjDFVO20dOacOdzY2ESYwHx/WYiNVfq9dwu55OXrNsSv0snJRkIBGrL4J2W4h3+zHGWvgG39japI2l8RVeVzzsB45lbYMZlzs6sGB/5Xwl67KtYadpC2hnDDhXy2Ujw1Sx5hKTpF3yXnVKFjahLhwgbL6GLYpFGI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXduEwcq; arc=pass smtp.client-ip=209.85.161.46
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a164b5e477so43401eaf.1
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 04:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782558692; cv=none;
        d=google.com; s=arc-20260327;
        b=IqeEDIboRmMV9rMI3VuJLptAXBDUWeA23Yd8vzTY29bXDInTSgwzDEImEASIYNwh7b
         F+9xdjTFZ+3rTibhopCKUUhqp1DwHQVFlC21uTPeWF7Jh5pCsrk2V4kaDpMxl1SCrVuH
         mlO4wgvNPMCFdmFn47IZMNylfVKdujqcXva/AWv181eWPncWmclOmO6bSnVPBK5QNwr2
         C9Hprx+I6qszayhjW6wq2xYIc76w3eLqF0qR7kH2mp9fG9g+ttsnYpwS0qrCt7WJR5DX
         53x3ewBRTYL5IoW9gmpXTWkB2XetukR7mE39PmUiPyU6j5trfiaruJM/tB1lOyrQlwLM
         cZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hM3qEvAQP+4N+WfxsG5wuceUCXkUQm4NPkDxKSERvqc=;
        fh=f3YzSaJ+DZM2coakQ2Pih31VRQwr/skiCNuTEWPnUg8=;
        b=nyeDRbI791jB5JZggM46SLXmsgFeccDHP7mR2aIBpMV9ZaVBcD8Hu9SfJYs+O3bhZb
         YOIdorpy/l4GBn/e6bpoKZKu73aBZ5Jc8hal5CuKvIuCEOaEORBbSEkYJN5WJd6SY44M
         z/RpJMwSv2LNvCSSL+mYUJYbm9pWTtG6Njk7CaaC2B88CdyKx6KP2qRdZBEnDOdwgCpt
         714GMK7cd5JS+yEYyOCuPHpbAhBRPvEsSu/URL+iv+4JtqewvA2dpp9lvVPoZEOg3rfv
         peaO2UZqUSpcaMzOoKWQvnU/otIAt7o4HKxeYkkPSlnsqIG2DN6751OsQQc+VTb8WyAE
         p+HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782558692; x=1783163492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM3qEvAQP+4N+WfxsG5wuceUCXkUQm4NPkDxKSERvqc=;
        b=KXduEwcqENSF/YSwSsGmjRcVH0FQ3Fe56XSwksMBycro70aw/VhGH3eBBL7oAcUTkr
         ttPCc+yzX2QITvLvOZcRiU+xR0EMCeWhaD6X57MsPtrB4uBg/dJ2YkH4HCXs2MwECDhn
         uD5Q0duOpmihkLTnX7OkhMemr4xA4Wwmquu0bfE0s2LZjZ+VtSdSN8EFoeb4+VBglpCn
         Vh+UF9zp+vZU07aDEAz9RYtSKKTRx0RvIxGrYuPoAh4sitFzRtq5aHF+9PKSiDrPEXpx
         Jzb3fOXoiS3yZ0+9BydtIH29RxFuNEj+przkpkHTooUFTpqSxbEPd27VBO56T+Y5/uql
         RChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782558692; x=1783163492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hM3qEvAQP+4N+WfxsG5wuceUCXkUQm4NPkDxKSERvqc=;
        b=FwfWtjYnHqbXrfkN/mLL+og95eV8NPEr26QspLKDOht8c2IQ0NPMtxsJGaYs89vp2o
         PwI/z42WWAeznhzm4P6DMsw0VmCoKQGvQyPRwy4h6/otDDS5KnHhEnn/JwsiwGf3jrvS
         Xv/nPQEFFhZ9zeuYVdGCKLDUukbpVb5w6KgnCWOkW3Ct1sEl6AbT6C6Lj74HJh7O550o
         b/dLge3GVJcSI7osCwn7/VF0v7vWwylAeTDK5eGkuF+jaBWZxTTbclSLKS1KqM2yzz8+
         R0pM0KNbG9dBumRdGeqCtPe/DdCKdpQdKlmCqqTBtyD+JKikm/bL4Nrqmvt2Q80KMA6t
         pL3w==
X-Forwarded-Encrypted: i=1; AFNElJ8ZT3mJ48vejDTHy5rCVgTXaHhV7NJzFyBbfIMzdsrYEkQQEtBhO58Rf7B7ezlGeUtA3crdA2Ef9qpNUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4cacJLJka9rkWU/whm1Q40ZbucbB/raN2RhMVmH3ZFGgkzaYF
	5pbXuAbOEwZjM4ojoBLpqL5f/IbwEMVR6m9xNgbD7M5GtQIxt7ORKWcZvroP+ikjcmpEDGez4fb
	DqMEjwHiNRtI1VrtdtR0pwP1E5jfgsH1qazvEluQx5Rnx
X-Gm-Gg: AfdE7ckIQNdRR9Rdv5Y1USS8S1CTHxZLHuizdGK1EJhhGPYFz64kOXdI3hcqnE5KSZL
	qaa/5z9wVeKTUnRdlsRTS5m4JutGY3AZ606CbzNiIUR+4tqBzjEIphNGQ+2b1QSPHbZmIXNGuQd
	c/6k7XWKRTglMpz3ULzHvsOhPM8dqXHJzJDxVKv+42H0SoEhCIsCjqK+deFJtbDjVfxedhUoj8Q
	pSW6zaguG5L3dYpJkDA5ZDb10bjfVw+0zYq7TqSzmTDvZ9uqXRDQ0r6RcRMDtAsrJZfmLikD0JQ
	TkGrqB0QwQ==
X-Received: by 2002:a05:6820:190c:b0:6a0:c657:1648 with SMTP id
 006d021491bc7-6a134417395mr6253038eaf.26.1782558691713; Sat, 27 Jun 2026
 04:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627105725.9083-1-robert.mader@collabora.com>
In-Reply-To: <20260627105725.9083-1-robert.mader@collabora.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 27 Jun 2026 16:11:20 +0500
X-Gm-Features: AVVi8CcQg8HE-YlQ3EE2-S8HdLohGCCEZBPKwGztjRak5S1gKFBZyUAO90eXmNo
Message-ID: <CABXGCsPHdi3=Tpg2uZhZMuLNmg8r9Bg=OgD39eyMc=pv8gc_TQ@mail.gmail.com>
Subject: Re: [PATCH v1] udmabuf: Ensure to perform cache synchronisation in begin_cpu_udmabuf()
To: Robert Mader <robert.mader@collabora.com>
Cc: vivek.kasireddy@intel.com, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:robert.mader@collabora.com,m:vivek.kasireddy@intel.com,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65796-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,collabora.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 721D56D1D10

On Sat, Jun 27, 2026 at 3:58=E2=80=AFPM Robert Mader <robert.mader@collabor=
a.com> wrote:
>
> The message of commit 504e2b4ab97a ("dma-buf/udmabuf: skip redundant cpu =
sync to
> fix cacheline EEXIST warning") says:
>
> > The CPU sync at map/unmap time is also redundant for udmabuf:
> > begin_cpu_udmabuf() and end_cpu_udmabuf() already perform explicit
> > cache synchronization via dma_sync_sgtable_for_cpu/device() when CPU
> > access is requested through the dma-buf interface.
>
> This, however, does not apply to the first time begin_cpu_udmabuf() is
> called on an udmabuf, in which case the implementation previously relied =
on
> get_sg_table() to perform the cache synchronisation.
>
> Ensure to call dma_sync_sgtable_for_cpu() in that case as well.
>
> Fixes: 504e2b4ab97a ("dma-buf/udmabuf: skip redundant cpu sync to fix cac=
heline EEXIST warning")
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> ---
>  drivers/dma-buf/udmabuf.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index bced421c0d65..08f57bc1294d 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -224,21 +224,22 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
>  {
>         struct udmabuf *ubuf =3D buf->priv;
>         struct device *dev =3D ubuf->device->this_device;
> -       int ret =3D 0;
>
>         if (!ubuf->sg) {
>                 ubuf->sg =3D get_sg_table(dev, buf, direction);
>                 if (IS_ERR(ubuf->sg)) {
> +                       int ret;
> +
>                         ret =3D PTR_ERR(ubuf->sg);
>                         ubuf->sg =3D NULL;
> +                       return ret;
>                 } else {
>                         ubuf->sg_dir =3D direction;
>                 }
> -       } else {
> -               dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
>         }
>
> -       return ret;
> +       dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
> +       return 0;
>  }
>
>  static int end_cpu_udmabuf(struct dma_buf *buf,
> --
> 2.54.0
>

Hi Robert,

Thanks for catching this. You're right -- with DMA_ATTR_SKIP_CPU_SYNC
in get_sg_table(), the first begin_cpu_udmabuf() call no longer gets
the implicit CPU sync that the dma_map path used to provide, and the
explicit sync in the old else-branch only ran when ubuf->sg already
existed.

The fix correctly moves dma_sync_sgtable_for_cpu() so it runs in both
cases. The logic looks right to me.

This wouldn't reproduce on x86 since DMA is cache-coherent there
(dma_sync_* is a no-op), which is why I missed it -- it only matters
on non-coherent architectures. My apologies for the regression.

Reviewed-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Thanks,
Mikhail

