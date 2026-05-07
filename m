Return-Path: <linux-media+bounces-60881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO0bGMUc/WmbXwAAu9opvQ
	(envelope-from <linux-media+bounces-60881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 01:14:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0E4F00E9
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 01:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C24DD301F180
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 23:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74223D1CB2;
	Thu,  7 May 2026 23:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pn9aNjVg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D647D2F8E99
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 23:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778195646; cv=pass; b=twvFQGSVVc1P8dt6zEuWbi5h++OtQzpEcqDQfb2JE0edguTG/o14PQJ5l+FI+CFCEJ2Oef5TOdceK7sh3ekJHda9M0an4o0MlIInlkjQwW0ebK8uhLaHGA+PJ4B/m14JdvJoflQRZ0Jw2rYPRa16ijXqolDR+FBNjTxOgXjtfaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778195646; c=relaxed/simple;
	bh=qlLnEfXAburRkr9MFRBZlHD7oyg9FCmGPljR67AGkUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvQlrLBC3am0L3A+UWX00OfEl0XNpNAM8FtpeLFvsZm666znCBWUDz6B8CJZusLYP82WhJqjjOy/VBGmvAWWg9luG15e3aVaCWltqsD5o1+IQPP4hL4jzG8XKRNyz1ANo+ILNr7YW8VQ1gWCSzF+kKPeDSoOeQCHwhuTD9lsipg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pn9aNjVg; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5751b7d147aso514910e0c.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 16:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778195644; cv=none;
        d=google.com; s=arc-20240605;
        b=NjhjXDrqj9PMt3CeIFKtqNQX9dYMcgsfoArq4vrLoO2R4tPGt1d1rGYhaJj54aFmJ3
         jVtCsLCQ7s27/bNz+75OCqs84K7zvKHTTCPc6ceHtSGz2d1eh5niTg1YoQz3Vsk9wlsb
         eQ8tzPAHQyk2tFIV0shk/KQRYqtPcVVsYxx6X3P83eVzv5O7MZenJuU+euvZWXFR5sRW
         XH3wpwlXLKoYxyYI3ULt+01BiVgieKqjEzp0WW03vcTluqAFAdHQpnbVzvjz1HU3d/55
         +u+NXNvrkSO7b1i1ToDMBKNs45BJriqSeAO1rrt0a/p8injdzO6Q+EcYJnK3Vf9vJ6JX
         DFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B//9uXe2EXgXLgjlkCJmsSkU/PXffclqLZCTSr4XZ0k=;
        fh=SUHx3lxdVvcKTVR88pDt0PHq6iishJqJW0D71/wP8Fc=;
        b=kS9ZaHUw9PS8cvFlrJOfYcHEbkTXDDZ5wFl5uks+NIyRMUG4me5FJXAXwdqt+mLt0C
         Sa4s9xtaJmSeXoSJAVg7ZA4JlybQSu5oSrCzg3VYQ5JzQgDi0OiF2HHsN/yO8mJrBLlo
         c8lOBMDLoarneCkJEGVV24GPVrGh4fU+iMvR2RwsqdPyWytt86xp9RC0IK01bOga9s/V
         DmOb62jc5JK1SzRndgqWqPz7FNezVA8odHoncOSDNQC0i+93HT69iGXWbAiS9himgUV+
         jofM91CZ2eBwU/uzG1hfUPNrutXcAG579JXRdpE6Gg5NMtv2Q6Gpz4WR/b3uN1OoxoMI
         YsZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778195644; x=1778800444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B//9uXe2EXgXLgjlkCJmsSkU/PXffclqLZCTSr4XZ0k=;
        b=pn9aNjVgVg8IQvgOKYg6Y2267LmiP8acDHoeYjb8OZXrSZunfgmQOeTk/TdAUpHBpn
         6sCJ/5axth5U344EOTarVwVeKmH7JTU0ygTLTiTEpwIiF9wwHC5EcJU4ekNiTYB8+PP5
         bx5SJFd8xQ7vpgEJkaEk35DhUE+aFNdPwFtEP5lI5AZyd4pN8YAZNl8nD4cXndVWB1HT
         vWSk9O79Ztg4X8C+s8IlEM5Of/2rNBXFacRt8CLA+MqR8POQPuQ59ex3nE+NdUsyCJac
         5ZFrHWJtfXsd2jG8+soLbKNQZDTW0Z3vB8GmAbh5zWV64nvZcFlaO3bwiYXvb8FY8DZc
         MA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778195644; x=1778800444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B//9uXe2EXgXLgjlkCJmsSkU/PXffclqLZCTSr4XZ0k=;
        b=aBmyFCjFpA2RKeEo5Fka0Q9MgFL+BMQIOI1V8erjN29IifOVDr9XTIo+8use/vtLZw
         IL+ufKxe0eFLcClysJwB4b7EzLjC4nQ2Ci9u/+L+8v7Z7QB9aDrUEtvpfVJszxE1RgqD
         ouBvbrmNq+nHKlinWeud0wbD669A2z4qd6ZGI+3d5cLYk1wf6aXnUZ0oFUcvsNiOUswu
         nyvi571gDYNDuMy4IJmBI+PnE0+7n/r/L2ox9x1AqgOCpCuotFZ8XHuXyJUffWWoV61q
         HG2bBHtVdxHu2TZkegqwVA6aBOUM6l6VCeLp9hZmLpI/4pB9xPRKub1z2vBe3fGAhV20
         t6jg==
X-Gm-Message-State: AOJu0YyhXc1VA/bbzn8yDBUmbQdwa34QjTJ3RiHQhlAhel3EK2HSS+Au
	hgLmUwL3Mb6ECYUGQTJmUhn2yC/HuV0+gCkiKI8a5N2yygmNJK+gjM9c3SVkzXwzxhLVPnihLle
	I6Ml5/m7tijORZbN0gtGomd5t7Keeux4=
X-Gm-Gg: AeBDievDVMlVWgLn8s9Y3EJZXYYNRtUzc7Z1Jjlky2lYZaEBZ5K78MrtDg+ZYyPnmN0
	lXYzAzDaICmU/l07zSH4xEbH/QfYIRE3H5tmGnXijrZgvaAN53e+qwiJ9RC58yAtfb6nLsErrLn
	xUzzxjubJPbsI8ywnu+ljoN6nD6Fjm+BQ/VrxJOz2BdJpSarWmrFoZnknphZszmVNlt28zrnBrH
	qVCt76nlLZZ32PvVdCFTP9yvG02q4m4TrtRo3ENCbGQKy9HP4yWve9Ak2P0rZN0cweDqUdVLJzn
	5yFqoP+AXCmRzOuH+E9lv0yDRlOQ0aWGYhULrQ==
X-Received: by 2002:a05:6122:3a06:b0:56b:8e1c:582d with SMTP id
 71dfb90a1353d-5755974b78emr5918356e0c.14.1778195643768; Thu, 07 May 2026
 16:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316132223.7337-1-sarah556726@gmail.com> <20260316132223.7337-3-sarah556726@gmail.com>
 <8f46eadf-d95c-4461-ae2b-251f0dc908ca@kernel.org>
In-Reply-To: <8f46eadf-d95c-4461-ae2b-251f0dc908ca@kernel.org>
From: Sarah <sarah556726@gmail.com>
Date: Fri, 8 May 2026 02:13:51 +0300
X-Gm-Features: AVHnY4Ka2BxzS2Cl-8cHjJmo-Mirc4z3UIgZObAzkENaMwk8xUI-lZgt8fWWncI
Message-ID: <CA+EShWQXSnRFyXu3-dV16KJta6R3GVOxYkGr09DMCHUMvh=7gg@mail.gmail.com>
Subject: Re: [PATCH v4l-utils 2/2] calculate expected length using v4l2-fwht info
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AAC0E4F00E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-60881-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,
Thanks for your review.

This patch was intended to address the TODO in
`get_expected_length_trace()`, which assumes that the stride equals
the real width and that padding follows the end of the chroma plane.
I adjusted the implementation for single-buffer formats and sent a V2.

Regards,
Sarah

=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=92=D7=
=B3, 17 =D7=91=D7=9E=D7=A8=D7=A5 2026 =D7=91-14:10 =D7=9E=D7=90=D7=AA =E2=
=80=AAHans Verkuil=E2=80=AC=E2=80=8F
<=E2=80=AAhverkuil+cisco@kernel.org=E2=80=AC=E2=80=8F>:=E2=80=AC
>
> Hi Sarah,
>
> On 16/03/2026 14:22, Sarah Gershuni wrote:
> > Update get_expected_length_trace to calculate the expected buffer lengt=
h
> > based on v4l2_fwht_find_pixfmt info.
> >
> > Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
> > ---
> >  utils/v4l2-tracer/trace-helper.cpp | 40 +++++++++++++++++++++---------
> >  1 file changed, 28 insertions(+), 12 deletions(-)
> >
> > diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/tra=
ce-helper.cpp
> > index 6c296dbf..a59d7761 100644
> > --- a/utils/v4l2-tracer/trace-helper.cpp
> > +++ b/utils/v4l2-tracer/trace-helper.cpp
> > @@ -6,6 +6,11 @@
> >  #include "trace.h"
> >  #include <math.h>
> >
> > +extern "C" {
> > +#include "codec-v4l2-fwht.h"
> > +}
> > +
> > +
> >  struct trace_context ctx_trace =3D {};
> >
> >  bool is_video_or_media_device(const char *path)
> > @@ -233,18 +238,29 @@ void print_buffers_trace(void)
> >
> >  unsigned get_expected_length_trace()
> >  {
> > -     /*
> > -      * TODO: this assumes that the stride is equal to the real width =
and that the
> > -      * padding follows the end of the chroma plane. It could be impro=
ved by
> > -      * following the model in v4l2-ctl-streaming.cpp read_write_padde=
d_frame()
> > -      */
> > -     unsigned expected_length =3D ctx_trace.width * ctx_trace.height;
> > -     if (ctx_trace.pixelformat =3D=3D V4L2_PIX_FMT_NV12 || ctx_trace.p=
ixelformat =3D=3D V4L2_PIX_FMT_YUV420) {
> > -             expected_length *=3D 3;
> > -             expected_length /=3D 2;
> > -             expected_length +=3D (expected_length % 2);
> > -     }
> > -     return expected_length;
> > +     const auto *info =3D v4l2_fwht_find_pixfmt(ctx_trace.pixelformat)=
;
> > +    if (!info)
> > +             return 0;
> > +
> > +    unsigned coded_height =3D ctx_trace.height;
> > +    unsigned expected =3D 0;
> > +
> > +    for (unsigned plane_idx =3D 0; plane_idx < info->planes_num; ++pla=
ne_idx) {
> > +        unsigned stride =3D ctx_trace.plane_bytesperline[plane_idx];
>
> Ah, this does not work. All the pixelformats that v4l2_fwht_find_pixfmt k=
nows are
> all single buffer formats, i.e. all planes are combined in a single buffe=
r.
> So there is also just one bytesperline value.
>
> I know, it's very confusing: the _MPLANE buffer types should really be ca=
lled
> _MBUFFER in hindsight. I.e. each plane has its own buffer as opposed to
> concatenating all planes in a single buffer.
>
> I'm not sure what problem you are attempting to fix, but I don't think th=
is does
> what you want it to do.
>
> Although patch 1/2 looks fine, I'll drop both patches since it makes no s=
ense
> in combination with this patch.
>
> It really only makes sense for multiplanar pixelformats like V4L2_PIX_FMT=
_NV12M,
> V4L2_PIX_FMT_YUV420M, etc., but that's not what this second patch deals w=
ith.
>
> Regards,
>
>         Hans
>
> > +
> > +        bool is_chroma =3D (plane_idx =3D=3D 1 || plane_idx =3D=3D 2);
> > +        unsigned h_div =3D is_chroma ? info->height_div : 1;
> > +
> > +        if (info->planes_num =3D=3D 3 && plane_idx =3D=3D 1)
> > +            stride /=3D 2;
> > +
> > +        if (plane_idx =3D=3D 1 &&
> > +            (info->id =3D=3D V4L2_PIX_FMT_NV24 || info->id =3D=3D V4L2=
_PIX_FMT_NV42))
> > +            stride *=3D 2;
> > +
> > +        expected +=3D stride * (coded_height / h_div);
> > +    }
> > +    return expected;
> >  }
> >
> >  void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)
>

