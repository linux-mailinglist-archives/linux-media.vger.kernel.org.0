Return-Path: <linux-media+bounces-12241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A818D4C29
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A3902871F8
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 13:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06DD1822E4;
	Thu, 30 May 2024 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O1nCdI2f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D7017CA10
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717074009; cv=none; b=VAf2lz7aukONqQb2kYwT2+cmj3m86Nbkp0OwD+n/PPWl5dknBeeOzmmLlSzcG7pYd/Ngfp3N/Kl7ke2YtfTM3KUAPFX6987BE9TSNz2Nh5hDf5pF149PAWmUjv9Tdg+GEtAH3hMAGjTF57OltxZ8kmqgmNzl1vfOf+vKoVOLc3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717074009; c=relaxed/simple;
	bh=pj0nrIN3Qs7jpx+J/3Wt1XvGRkbyRR2Eq5pw8utiL9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpbY1I2Uf51pRz5JB+12IMuIr50KsLg6DGLWOtXH2Bb+am1mU/pq720b+VnK/2NsxkQOd8X0zRZTlvlb6LoS/kGhXuJOHC2SxJKixejWtY18yTutDF9GuEX6KmLUE3G/XA+OL2PsF3YBwobM6fydDavYcr4qF0yXdVPWe4YdOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O1nCdI2f; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43fe0f361b5so4035581cf.0
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717074006; x=1717678806; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oTphgebvOjeWdN1xBiIRxM6zg0yoJ4DRfXlzkZveD5Q=;
        b=O1nCdI2fdN5Y+znKyN3kmo4SeLL1XCTZwNqHqLYRSo+/RwgDJAjR92iOdSG3RkStYt
         pyP77JIeDSmehbeHb9uxUX6f7guvd/aWQz8xoQ9k+DNew+a5BoMAAO4KJk3pAP2VdMkN
         n/3t7oj8iZp+0KjYqcuENRtxS1Aomi2FiaGg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717074006; x=1717678806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTphgebvOjeWdN1xBiIRxM6zg0yoJ4DRfXlzkZveD5Q=;
        b=FnQt5vmwxf0uRMLe8dm3QvPu7VW4Gnf2A8wRdRIKxUMH3ExiSbSw1RNs5BAuscOjEd
         1YeLrxJ3vF5har3NX0MNLo+ghnXv27/Kpv9+V3GCzlAzCs44QNDbZzhfg9231MbJiWHw
         pW83vrNVM6cCzam7RZtdi8btR4YzbIB9l63vc4SFO//1ykj7UFYRgAs7YIZqA9Scbhy/
         Xry66k3VyuNAQ/DctTTKbfP5zG1MXFTidP1QytM8E6fYlzFn56IB8mNYvssR8OwhdQds
         cWG/IEp8FwK2IX/qZZ34pdQ6vLYQjErLtVv2TWGZAX+F8v9GRBBrrmuiBdBqmKR3mYTG
         E7UA==
X-Forwarded-Encrypted: i=1; AJvYcCUmKy3sEybXVP6H/q8RxMw8sQcKBfXzKxL0eWXb6EA1p0i/V2wila8sbrYCiZmmgTOFMNYZwAULHh8a7aNapswNJRz4jXR/bqGzF8I=
X-Gm-Message-State: AOJu0YwDVK3R/lCPVBHpPJ7g4+QruuK2gSDFF0CuNbUye4S020ZKO4vt
	obvW4pMmb20zFWatsVGZ1eZuj4cAFoGZPsxJjob5aAg8r0DaTPwbBksBeCZKFQlh8lmrn3QwTwI
	0iw==
X-Google-Smtp-Source: AGHT+IGMnjedVpxnVXn+4RtSzy7vzxx9+LNB64aB4VQFfOtijK0JZMxKaAvY73MIWBxMSckFOLGwsg==
X-Received: by 2002:a05:6214:3288:b0:6ab:8db1:8223 with SMTP id 6a1803df08f44-6ae0cafc324mr20302686d6.13.1717074006150;
        Thu, 30 May 2024 06:00:06 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad9d1d7611sm18777006d6.100.2024.05.30.06.00.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:00:05 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ae0adfba9cso4362306d6.2
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 06:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHWaAyGPctuVT+q9Hk9gTY4Tnkpm9RlffZOnONrFlm+93gDjOvJ9tWQofLhvZoi40LJXW/j9rDro9ditucG83OEqu193HQVUsX2sM=
X-Received: by 2002:a05:6214:3b82:b0:6ae:5b:c181 with SMTP id
 6a1803df08f44-6ae0cce1c83mr25263506d6.63.1717074003733; Thu, 30 May 2024
 06:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
 <20240527-cocci-flexarray-v3-3-cda09c535816@chromium.org> <6823bc58-9461-4a54-b5b3-7ea5c46fc68b@xs4all.nl>
In-Reply-To: <6823bc58-9461-4a54-b5b3-7ea5c46fc68b@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 30 May 2024 14:59:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCt0PXTP63=dkNpUvH6mYSJ2_mr5xiOd9=RpLqVoD4YY_g@mail.gmail.com>
Message-ID: <CANiDSCt0PXTP63=dkNpUvH6mYSJ2_mr5xiOd9=RpLqVoD4YY_g@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Thu, 30 May 2024 at 14:33, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 27/05/2024 23:08, Ricardo Ribalda wrote:
> > Replace a single element array, with a single element field.
> >
> > The following cocci warning is fixed:
> > drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-frontends/mxl5xx.c      | 2 +-
> >  drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
> > index 91e9c378397c..a15c0438b07a 100644
> > --- a/drivers/media/dvb-frontends/mxl5xx.c
> > +++ b/drivers/media/dvb-frontends/mxl5xx.c
> > @@ -893,7 +893,7 @@ static int do_firmware_download(struct mxl *state, u8 *mbin_buffer_ptr,
> >       status = write_register(state, FW_DL_SIGN_ADDR, 0);
> >       if (status)
> >               return status;
> > -     segment_ptr = (struct MBIN_SEGMENT_T *) (&mbin_ptr->data[0]);
> > +     segment_ptr = (struct MBIN_SEGMENT_T *)(&mbin_ptr->data);
> >       for (index = 0; index < mbin_ptr->header.num_segments; index++) {
> >               if (segment_ptr->header.id != MBIN_SEGMENT_HEADER_ID) {
> >                       dev_err(state->i2cdev, "%s: Invalid segment header ID (%c)\n",
> > diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
> > index 097271f73740..3c5d75ed8fea 100644
> > --- a/drivers/media/dvb-frontends/mxl5xx_defs.h
> > +++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
> > @@ -168,7 +168,7 @@ struct MBIN_FILE_HEADER_T {
> >
> >  struct MBIN_FILE_T {
> >       struct MBIN_FILE_HEADER_T header;
> > -     u8 data[1];
> > +     u8 data;
>
> From what I can tell, shouldn't this be 'data[]'? It really appears to be a flexible array.

The field is mainly used to ease the data parsing. There was only
data[0] used, so I decided to make it into a single element array to
avoid changing the size of the structure....

But you are correct, it looks more clear as a flex array and there is
no allocation or sizeof() so I think it is safe to change its size.

Will squash with the MBIN_SEGMENT_T patch also

Thanks!


>
> Regards,
>
>         Hans
>
> >  };
> >
> >  struct MBIN_SEGMENT_HEADER_T {
> >
>


-- 
Ricardo Ribalda

