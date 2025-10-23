Return-Path: <linux-media+bounces-45386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 165AFC01406
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A3B34F4C1C
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA983148B6;
	Thu, 23 Oct 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="fAzzQ2Zr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C44307AF5
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224610; cv=none; b=It6ApNQktjgpQ9mMxLXW7ny9bY8InSb/tEd0eRglFvb0Ri9WGDFAN0YXqN5+7y4KTHZlJxSSIAeCdFEUJOPQj9rOAvLHsk1yLM6hBj7VLCbQ3/KXiCfaSZ5ZkrVrWFJP8etZFkrbOakI+0CVVB+9ufHzWSe+ALQVCXWrMi5PiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224610; c=relaxed/simple;
	bh=dVjSgjUVHG2gC5otLGThI0jUJVNy+z1H2EkRmkKOaKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jt7IWOg/aO5G7rgX5GcxNpPPSDS4Kgj8Ad73FMRDOdaDdzfaxZM0TVTf1PtV+P3jB4Upue/A4elmlpTo3cswGxb+JqDxIoL9bFt6fRcxyfuaTE+gHUGrzzLm3QZc6S8tHC0XwI+KVQSWUmCGtpWhsnMYyJW5sgxIFKzRIzIUYaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=fAzzQ2Zr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b50645ecfbbso162791866b.1
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1761224607; x=1761829407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rQz2zzhNXcewyKRu/6/YPC764DvwqqcoBjiIwzMxqic=;
        b=fAzzQ2ZriOVrVy9vOkCdGPDcBbRF1UD++OH8J9Wo3/WnyXUYAa1McMLp06jQ/McJ7D
         i4wKdyRArCIPiwX8zfwpUhX82yUWnhKy/p+C+//8Q5pAI2o+w4qrI+TG61n1reVxwYwN
         beRxktHfx5pBUVzh6nJ66sU+8xdkv+Gtmrw06OGsPaGC5NR6pofvhhEG8skPuEBq4pkL
         Rwh3vzYMlFZLLX0zhgs9wTlRq+4IMLnmm8CPwSHPTPThaEhwZtmOOPWYL1xCVCTiSccN
         NSwdmJQgcSj7t7OPSslAKKrVVW2E3b3oMx/rD+LQbAoxMYwQ3hTiPF0NIh4Ij36OtNnZ
         jDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224607; x=1761829407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQz2zzhNXcewyKRu/6/YPC764DvwqqcoBjiIwzMxqic=;
        b=wRMjN2JUM1UhuXpmSuehqnKMuGHd9ciMAHqxWK4YJdt0EwsWbayswpCqykYF4ffFkf
         k89zu+vyEEzZpHmzXIdA9NtjNW2nG6dV2Bk5f/ybJDk0gIj3xTreQsObTI4xsOdyFiVb
         zu186+/lSOxPxagb4TNPmvZzilhcN/O12sDpf9D7SgcQxc1WTCl3FiaBlIDsGCzKoI0O
         YLv6KKoWTWLm8bKqNV/2bCnz/9UU0h0UoK3LRvBQNIO58f2W1UICGXTNW2Gs+K+Y2xXU
         P0RHJ7dQ1u1SQW0wR4yaS3OJVl7u+WlMpCV9G/fObhsvU11SY8dwtUbL0dTn1z+FIKsr
         wBxA==
X-Forwarded-Encrypted: i=1; AJvYcCWrX2rNO94APXp2MfPA+hcZlcOqVHhg4l0hakUfS5gJ9UAMcXMMp2gEDnyclbDlphaPHdB74LIKmDfX+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiIIsZCHaWIrBLMPCQ0KMgmL7BcdvvN+04CD8jp/iOUgR7paP
	3jii1g9eC5vtU1V6gLuTeo1IG2qJ8FlD5DWqFAnxQI5LKw0PLB+fRfBqlBw/EOSDC68rLY9U0tq
	co8uaqhmEKWfb0gnD/TcYrIuO3xbOGHFZlUzCuywiQA==
X-Gm-Gg: ASbGnctf68wqSGkdGLCliTO6ohjlpNUzRV34zruGfAWXqhEGQYr9ntCgaP6fUfw6b+8
	v6rjk5/soPmavY4aG5KpWMrv3C6GaKg0J7S93l0T/HJbxGF7e9rs4xRD0EwrIM/vJ8/DRo4HPqS
	6CW9gvOoVSSmNRUpWz0Rc4RBGwNO+z/kvhbZ6OsmbBfDicoKuc649I2unlREqYznC6itrI0bHuV
	B2E5t14b/DL2A/wIJafv2vJiORZxZzBnKja2I7rq1eezsXel4A4uvgmLVQ=
X-Google-Smtp-Source: AGHT+IHjEil1xwB1kyyeHzGlMRLeZxB/fmA1t+VRuvWQ8L8x/8y3yupxVI3uySMkBoo9S0ZyIP21qY8I2m5JTPfCxcY=
X-Received: by 2002:a17:906:b80c:b0:b3d:6fff:9a0e with SMTP id
 a640c23a62f3a-b6475012762mr2293117266b.53.1761224607102; Thu, 23 Oct 2025
 06:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913105252.26886-1-opensource206@gmail.com>
 <8199bec4-b9e1-4d6e-98da-a4d7eb667437@kernel.org> <CAKPKb8-s96v+Nh29Z5E0wgyXYgoFHJT2SHA_WpZshXspo0WY0w@mail.gmail.com>
 <f9001f98-80d6-49d5-8665-d42fcef7b07d@kernel.org>
In-Reply-To: <f9001f98-80d6-49d5-8665-d42fcef7b07d@kernel.org>
Reply-To: jc@kynesim.co.uk
From: John Cox <jc@kynesim.co.uk>
Date: Thu, 23 Oct 2025 14:03:15 +0100
X-Gm-Features: AS18NWDf7lW6qB3D2uGVwOaERQchs1i9Lttqltolx2HpMPVt9UGchsP9jeOurqA
Message-ID: <CAFyCYyOFFMrDetScx_8_VgRpCVyTq_O0PGn1hDt7+UwMygqeXw@mail.gmail.com>
Subject: Re: [PATCH v3] media: v4l2-ctrls: add full AV1 profile validation in validate_av1_sequence()
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: opensource india <opensource206@gmail.com>, mchehab@kernel.org, hverkuil@kernel.org, 
	ribalda@chromium.org, laurent.pinchart@ideasonboard.com, yunkec@google.com, 
	sakari.ailus@linux.intel.com, james.cowgill@blaize.com, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Oct 2025 at 11:44, Hans Verkuil <hverkuil+cisco@kernel.org> wrot=
e:
>
> On 23/10/2025 12:32, opensource india wrote:
> > On Wed, Oct 22, 2025 at 12:44=E2=80=AFPM Hans Verkuil <hverkuil+cisco@k=
ernel.org> wrote:
> >>
> >> Hi Pavan,
> >>
> >> On 13/09/2025 12:52, Pavan Bobba wrote:
> >>> Complete the "TODO: PROFILES" by enforcing profile-specific and
> >>> monochrome constraints as defined by the AV1 specification
> >>> (Section 5.5.2, "Color config syntax").
> >>>
> >>> The validator now checks:
> >>>
> >>>  - Flags: reject any unknown bits set in sequence->flags
> >>>  - Profile range: only profiles 0..2 are valid
> >>>  - Profile 0: 8/10-bit only, subsampling must be 4:2:0 (sx=3D1, sy=3D=
1),
> >>>    monochrome allowed
> >>>  - Profile 1: 8/10-bit only, subsampling must be 4:4:4 (sx=3D0, sy=3D=
0),
> >>>    monochrome forbidden
> >>>  - Profile 2:
> >>>     * 8/10-bit: only 4:2:2 allowed (sx=3D1, sy=3D0)
> >>>     * 12-bit: 4:4:4 (sx=3D0, sy=3D0), 4:2:2 (sx=3D1, sy=3D0), or 4:2:=
0 (sx=3D1, sy=3D1)
> >>>       allowed
> >>>  - Monochrome path (all profiles except 1): forces subsampling_x=3D1,
> >>>    subsampling_y=3D1, separate_uv_delta_q=3D0
> >>>
> >>> These checks prevent userspace from providing invalid AV1 sequence
> >>> headers that would otherwise be accepted, leading to undefined driver
> >>> or hardware behavior.
> >>
> >> This patch was merged in our media-committers next branch, but I notic=
ed that
> >> it now fails the v4l2-compliance test for the visl driver.
> >>
> >> The cause is that the new validation now fails with the default values=
 for
> >> this control as set in std_init_compound().
> >>
> >> You can test this yourself by loading the visl driver and then running
> >> v4l2-compliance -d /dev/videoX -E --verbose
> >> (-E stops at the first error)
> >>
> >> Can you provide a patch to initialize this control with sane values?
> >>
> >> Apologies for not noticing this before: there are some issues with the=
 automatic
> >> regression tests in our CI, so the tests weren't run.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >
> > Hi Hans Verkuil,
> >
> > Thank you so much for the review.
> > yes, v4l2-compliance expected to fail indeed since it is sending
> > default values which, our newly added code rejects as per
> > specification
> >
> > when you say patch, you mean patch for v4l2-compliance tool with
> > proper values so that v4l2 core driver can accept?
>
> No, std_init_compound() in the kernel needs to be patched so the initial
> value of this control passes the new validation tests. The initial contro=
l
> values should always be sane.

Whilst that is a good principle it makes almost no sense in this
context. There is almost no chance that a given bitstream will decode
against a default sequence header and failing to set it explicitly is
going to be a mistake on the users part. It seems to me that it is
better to have something that is detectable as unset rather than
something that is valid but wrong.

I accept that it is the V4L2 way to require "valid" default values for
all supported ctrls, but it seems to me to be actively unhelpful for
things like SPS / VPS / Tile Group Entry where if not set correctly
from bits of the bitstream that the kernel doesn't get to see they
will break the stream decode.

I'm not going to argue this point but I felt that I wanted to make it.

Regards

John Cox
> Regards,
>
>         Hans
>

