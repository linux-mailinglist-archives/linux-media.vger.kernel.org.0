Return-Path: <linux-media+bounces-32849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34FEABC9F4
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 23:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E60157A2E95
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 21:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CC7221573;
	Mon, 19 May 2025 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr73uh8z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387921C9E7;
	Mon, 19 May 2025 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689913; cv=none; b=XFe2G3guEx9wHnKZt8anLsJQXMUy32iFVYGHKEnhq02AOGxw7R2WBlNGQ3+/mjUzWC5wRLTjEM7vWnQSexzc4Ua5nsPNA+u4sIs3TdVtR7EWPXGlskOfhI2WGoiMtZVgJ1aPbNegI3fmaqvO5AF8vxQ2epCExOnUpeGHfJIGkWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689913; c=relaxed/simple;
	bh=CZ691peLINPSUAyU3kO729Ie7ID8c0016wN9NHPkQps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXyEM5gwxATiprjoMlAUcVU52MPccTag/ynW5Qjo302qWb7vbD8t/YNb2e/4I6uP03byy2g4n0hKlDA0O0f6AuYwJd/ulZcFtNYq+9HdR8tJZW7Yxe06yvZDQLjQXPk59cIv6ZYOKjrPG0pYLSO4EZIDTS5FYKKN6YAsnQUheRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lr73uh8z; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86a52889f45so24020839f.3;
        Mon, 19 May 2025 14:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747689911; x=1748294711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4mHlbF3wl/qb51JPbWQ5yBWuZWdTliQjQN9iEmdGIg=;
        b=lr73uh8zO4Eiy0DgiX5ySa30nM0aGc5N3JNgXFI1hZvRg1Z8p3Q52mb2zuXuL79QTl
         um9N/Z5QqvJA1kCNibep/2aqnpVsUquhG/pGmDRnCxmF0zmQX+on8D+/QdwI0lQn5YtW
         aRAfZSgayEU7WtoSz+CKbB3t4DSTnwlToIEjOeBl2ToPEG/NTu3roZT+b+Y51/J4rQSq
         3IpU+DdeBvaPOZX5X+nxcQSimAPK0oN9W4Iyj/YeTOhaHYxd/Xb1YyBTLNUqacyBEp6T
         vF46Ohpf6pJ37Kt/TTeiXIDTC45f4etNEMaYiTi6mllVHWak4HUBbej+Wv0ayZShEd7o
         RXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747689911; x=1748294711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4mHlbF3wl/qb51JPbWQ5yBWuZWdTliQjQN9iEmdGIg=;
        b=YQEFe+GZ4MSSDe1pumuSIc2VvqkeY+GJDcYGPhhm3zv9Wg5HPIPcYZAkh+3uoy10XB
         wwj46Km/qIsVKHcM/2HAiVMtmW0xbpl2QYilX/tfL8PTnc2joqwDJBv8oXPj/E7YKGAo
         HWh6Lg2Tosw/TRz/gpJSKmBD1PwjHF9tOuprfOuuH6JbtwaCRtccDtBULmedOe3nkipY
         6UuN/NRv8aqGQ/+1NwgxXPThy55ANyLwFauoxj7fTFd3mArlUgNvJ7gUzjh41bd1u5hr
         VU8iBuCUVMiEVVXvX1II1xMaI3dA4KqkAx08y+hbns27apB8GFwzduEoNfHbYJDdfU3y
         HHew==
X-Forwarded-Encrypted: i=1; AJvYcCV6G/HtYDFcaCDAbt6jJAf9T4fPXzoz85Uw1HGw7LyrzGXFFsmBLxJA0dJttDqLYlbKLWYV+v1BM0nkPM/b@vger.kernel.org, AJvYcCWSJHCGjMI/zBad6imMgM9VVP8qxN3Xj/GzCiqKd4nYEV76Kr6xfXwzekWt26+dyTs6oF3KAakWOi5B+KY=@vger.kernel.org, AJvYcCXk6zKHSwJImA9RZqnjebfZoj7YWglRp6D1w4LFMnkBocAVERfEOMVpFXSCb1m9q4Aapc6Sr81tGvUBFsIz@vger.kernel.org
X-Gm-Message-State: AOJu0YyFn7eGg8yjXCKBFzryv/uXAHd7EiTdk93kwlzlxcEZ8GeKiMfT
	hX6uZ8utgDvtMU3bSpFigNmGpSxfYwzk+rWnrfcISDGrGmUt6SMySZPh0m49V4IDEzcT0L6txHt
	GKVOKHklhvMbWdVqfVwoa3izjROM6TsLauMSw
X-Gm-Gg: ASbGnctR26FwVY4DzRxsG1lV/bzV5JY+Hb/4u38g4+IWSSC0g/SZULPXLaLfT7eZIWy
	JkXhQJXslulq0RBPnCF7jBkQmyWUStAj16DMqgSdH2MtVQZfQH7U0ClVALu5+MtMYtfRnPh+oSV
	m0JO9szK4lqF0UA/Qsc7ydIl/uvv8A/zxaNciawntT+RrQFZ6YBTiwHQytRs11EXFLt3CfNMTFw
	qCrbA==
X-Google-Smtp-Source: AGHT+IEpXnbxrm+y9gNaRiUJIS+Wr3A9qyJLNZQ6jRp+M8ohLE3gUy60b6QHqU0uVa09nwBcd4Z4m6UiuBOEBYIoxLA=
X-Received: by 2002:a05:6602:4802:b0:864:48eb:30fd with SMTP id
 ca18e2360f4ac-86a23227308mr1602924239f.11.1747689911296; Mon, 19 May 2025
 14:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519175348.11924-1-robdclark@gmail.com> <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
In-Reply-To: <CAPM=9tw183FMOT8uUacqegnb5CREAyr8KbXxO2mCuFK-SmUB1A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 May 2025 14:24:58 -0700
X-Gm-Features: AX0GCFspyxeD68pvp-yDVVZyGDsNu-QeNUAbWG4ptcBy1923782_er28qi-T_4E
Message-ID: <CAF6AEGuDTGVq7sw4oVuHb+cOE_DuKbEPO956oddVcsV2boieoQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
	Christopher Snowhill <chris@kode54.net>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Jonathan Marek <jonathan@marek.ca>, Jun Nie <jun.nie@linaro.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linaro-mm-sig@lists.linaro.org>, 
	"m oderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linux-media@vger.kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 2:15=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Tue, 20 May 2025 at 03:54, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Spar=
se
> > Memory[2] in the form of:
> >
> > 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP=
/
> >    MAP_NULL/UNMAP commands
> >
> > 2. A new VM_BIND ioctl to allow submitting batches of one or more
> >    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> >
> > I did not implement support for synchronous VM_BIND commands.  Since
> > userspace could just immediately wait for the `SUBMIT` to complete, I d=
on't
> > think we need this extra complexity in the kernel.  Synchronous/immedia=
te
> > VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.
>
> This seems suboptimal for Vulkan userspaces. non-sparse binds are all
> synchronous, you are adding an extra ioctl to wait, or do you manage
> these via a different mechanism?

Normally it's just an extra in-fence for the SUBMIT ioctl to ensure
the binds happen before cmd execution

When it comes to UAPI, it's easier to add something later, than to
take something away, so I don't see a problem adding synchronous binds
later if that proves to be needed.  But I don't think it is.

BR,
-R

