Return-Path: <linux-media+bounces-841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AB37F4A3A
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15F5F280FAE
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4907468;
	Wed, 22 Nov 2023 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqOjTSYr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE74C3D0
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 15:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDBDC433C7;
	Wed, 22 Nov 2023 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700666753;
	bh=+aMtF9o/I+2Y/BQkCHJeGkWK7rYW/+sp7CQq2jIm2wk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=rqOjTSYrhOIq0Uu+k2isGwQOOGyM6ANvDLEZMM0uU02tjCjNqKilNrOyjg9V3zbcR
	 2wJyT6PoX2uxn6R1pzDz/611Orm5nnE/bO2j7y6m3ftLPQtSeyPbrtJbCjDmkqWBr8
	 C+Qkzimr0sK+w/tvtIrpiIwIm0JPWzb7Ri5tWrdEkI/SpYE0mo/tFVgBKkUCxyNfoO
	 O30/qhVzrQYpafqLcOYBE0Tz2R7YlvnClf4vOGitVwPBvvzCs2qvAZBVhwguz2r9Fg
	 Q4Ca6Ul1jKxRpWTKoEgCkCpHvrQEykFH+W99e5vxU7a/3IUeciQei4qZtd186QlvI2
	 J/Ix20Kg7qjoA==
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cf52e5e07eso7316975ad.0;
        Wed, 22 Nov 2023 07:25:52 -0800 (PST)
X-Gm-Message-State: AOJu0YyGUOBl8mybuYfe0kgf69I0KHDY3KbMnLdNA++Sgc9615lHNRWZ
	oVZAEjkYR+2DiN0At9WBEjQjl87d0ag/MFR5TkA=
X-Google-Smtp-Source: AGHT+IFuaX1vlFLiWY1su1XZ/dCeNdLqMXHHIn0JR9kAzO60/vRWQflUQCRJ0HY1dUAaBB8PlTlXErykm9YbN2wf+YI=
X-Received: by 2002:a17:90b:2684:b0:27d:2d2f:9ca2 with SMTP id
 pl4-20020a17090b268400b0027d2d2f9ca2mr8585449pjb.24.1700666752477; Wed, 22
 Nov 2023 07:25:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231105233630.3927502-1-jonas@kwiboo.se> <39d991e9-6afd-4207-ad09-e342a6c02485@xs4all.nl>
 <c35c91be-a931-47e8-b5e8-5a4a83c841da@kwiboo.se> <82f81f63-3dfa-42fe-8744-63f36d73bb77@xs4all.nl>
In-Reply-To: <82f81f63-3dfa-42fe-8744-63f36d73bb77@xs4all.nl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Nov 2023 23:25:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v66PHCo1aEdEv3UCVLC_b7SodTuveqn7XWdOyCmaLSiWMg@mail.gmail.com>
Message-ID: <CAGb2v66PHCo1aEdEv3UCVLC_b7SodTuveqn7XWdOyCmaLSiWMg@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: rkvdec: Add HEVC backend
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jonas Karlman <jonas@kwiboo.se>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Alex Bee <knaerzche@gmail.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Christopher Obbard <chris.obbard@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 11:23=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4al=
l.nl> wrote:
>
> On 09/11/2023 18:44, Jonas Karlman wrote:
> > Hi Hans,
> >
> > On 2023-11-07 14:49, Hans Verkuil wrote:
> >> Hi Jonas,
> >>
> >> On 06/11/2023 00:36, Jonas Karlman wrote:
> >>> This series add a HEVC backend to the Rockchip Video Decoder driver.
> >>>
> >>> A version of this HEVC backend has been in use by the LibreELEC distr=
o
> >>> for the past 3+ years [1]. It was initially created based on a copy o=
f
> >>> the H264 backend, unstable HEVC uAPI controls and a cabac table + sca=
ling
> >>> matrix functions shamelessly copied 1:1 from the Rockchip mpp library=
.
> >>>
> >>> It has since then been extended to use the stable HEVC uAPI controls =
and
> >>> improved opon e.g. to include support for rk3288 and fix decoding iss=
ues
> >>> by Alex Bee and Nicolas Dufresne.
> >>>
> >>> The version submitted in this series is based on the code currently u=
sed
> >>> by the LibreELEC distro, excluding hard/soft reset, and with cabac ta=
ble
> >>> and scaling matrix functions picked from Sebastian Fricke prior serie=
s
> >>> to add a HEVC backend [2].
> >>>
> >>> Big thanks to Alex Bee, Nicolas Dufresne and Sebastian Fricke for mak=
ing
> >>> this series possible!
> >>
> >> I ran this series through smatch and found these two issues:
> >>
> >> drivers/staging/media/rkvdec/rkvdec-hevc.c: In function 'transpose_and=
_flatten_matrices':
> >> drivers/staging/media/rkvdec/rkvdec-hevc.c:429:83: warning: variable '=
new_value' set but not used [-Wunused-but-set-variable]
> >>   429 |         int i, j, row, x_offset, matrix_offset, rot_index, y_o=
ffset, matrix_size, new_value;
> >>       |                                                               =
                    ^~~~~~~~~
> >> drivers/staging/media/rkvdec/rkvdec-hevc.c:756 rkvdec_hevc_run_preambl=
e() error: we previously assumed 'ctrl' could be null (see line 755)
> >
> > Thanks, will fix in v2.
> >
> >>
> >> Also, this series drops the HEVC part from the TODO file, but
> >> I wonder if the last remaining item is still valid:
> >>
> >> * Evaluate introducing a helper to consolidate duplicated
> >>   code in rkvdec_request_validate and cedrus_request_validate.
> >>   The helper needs to the driver private data associated with
> >>   the videobuf2 queue, from a media request.
> >>
> >> It doesn't look like there is much duplicate code at all. It is certai=
nly not
> >> something that prevents this driver from moving out of staging.
> >
> > I agree, if this is still valid it is not something that should prevent
> > this driver from moving out of staging.
> >
> > There is however one remaining feature/issue that is not listed in TODO=
.
> >
> > In certain situations the hw block may need a reset after there has bee=
n
> > a decoding error, especially after a hevc decoding error. Decoding can
> > typically be re-started with successful result after a short pm
> > autosuspend timeout.
> >
> > We do have a soft/hard reset implementation in LibreELEC-distro,
> > excluded it from this series because reset is typically not needed, and
> > I think the reset code need some rework to be upstream ready.
> >
> > Would missing hard reset support be a reason for keeping this driver
> > in staging?
>
> I think Nicolas would be better placed to comment on that. If it is not
> considered a blocker, shouldn't there at least be a patch adding comments
> at the relevant place describing this issue? That way it is at least
> documented as a known issue.

FWIW Hantro on i.MX8MM doesn't either.

ChenYu

> Regards,
>
>         Hans
>
> >
> > Regards,
> > Jonas
> >
> >>
> >> Regards,
> >>
> >>      Hans
> >>
> >>>
> >>> Patch 1 add the new HEVC backend.
> >>> Patch 2-3 add variants support to the driver.
> >>> Patch 4 add support for a rk3288 variant.
> >>> Patch 5 add a rk3328 variant to work around hw quirks.
> >>> Patch 6-7 add device tree node for rk3288.
> >>> Patch 8-9 extend vdec node reg size to include cache/perf registers.
> >>>
> >>> This was tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
> >>>
> >>>   v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
> >>>   ...
> >>>   Total for rkvdec device /dev/video1: 46, Succeeded: 46, Failed: 0, =
Warnings: 0
> >>>
> >>>   Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-V4L2-re=
quest
> >>>   ...
> >>>   Ran 135/147 tests successfully
> >>>
> >>>   Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-V4L2-re=
quest
> >>>   ...
> >>>   Ran 9/9 tests successfully
> >>>
> >>> And on a TinkerBoard (RK3288):
> >>>
> >>>   v4l2-compliance 1.24.1, 32 bits, 32-bit time_t
> >>>   ...
> >>>   Total for rkvdec device /dev/video3: 47, Succeeded: 47, Failed: 0, =
Warnings: 0
> >>>
> >>>   Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-V4L2-re=
quest
> >>>   ...
> >>>   Ran 137/147 tests successfully
> >>>
> >>>   Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-V4L2-re=
quest
> >>>   ...
> >>>   Ran 9/9 tests successfully
> >>>
> >>> This series depend on the following series:
> >>> - media: rkvdec: Add H.264 High 10 and 4:2:2 profile support [3]
> >>>
> >>> To fully runtime test this series you need above series and ffmpeg
> >>> patches from [4], this series and its depends is also available at [5=
].
> >>>
> >>> Full summary of fluster run can be found at [6].
> >>>
> >>> [1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Ro=
ckchip/patches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch
> >>> [2] https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-=
rc1-v2-0-fa1897efac14@collabora.com/
> >>> [3] https://lore.kernel.org/linux-media/20231105165521.3592037-1-jona=
s@kwiboo.se/
> >>> [4] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-n6.1-dev/
> >>> [5] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-h=
evc-v1/
> >>> [6] https://gist.github.com/Kwiboo/4c0ed87774dede44ce6838451a1ec93d
> >>>
> >>> Regards,
> >>> Jonas
> >>>
> >>> Alex Bee (5):
> >>>   media: rkvdec: Add variants support
> >>>   media: rkvdec: Add RK3288 variant
> >>>   media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
> >>>   ARM: dts: rockchip: Add vdec node for RK3288
> >>>   arm64: dts: rockchip: Expand reg size of vdec node for RK3399
> >>>
> >>> Jonas Karlman (4):
> >>>   media: rkvdec: Add HEVC backend
> >>>   media: rkvdec: Implement capability filtering
> >>>   media: dt-bindings: rockchip,vdec: Add RK3288 compatible
> >>>   arm64: dts: rockchip: Expand reg size of vdec node for RK3328
> >>>
> >>>  .../bindings/media/rockchip,vdec.yaml         |    4 +-
> >>>  arch/arm/boot/dts/rockchip/rk3288.dtsi        |   17 +-
> >>>  arch/arm64/boot/dts/rockchip/rk3328.dtsi      |    2 +-
> >>>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |    6 +-
> >>>  drivers/staging/media/rkvdec/Makefile         |    2 +-
> >>>  drivers/staging/media/rkvdec/TODO             |    7 -
> >>>  .../staging/media/rkvdec/rkvdec-hevc-data.c   | 1848 +++++++++++++++=
++
> >>>  drivers/staging/media/rkvdec/rkvdec-hevc.c    |  823 ++++++++
> >>>  drivers/staging/media/rkvdec/rkvdec-regs.h    |    3 +
> >>>  drivers/staging/media/rkvdec/rkvdec-vp9.c     |   10 +
> >>>  drivers/staging/media/rkvdec/rkvdec.c         |  180 +-
> >>>  drivers/staging/media/rkvdec/rkvdec.h         |   15 +
> >>>  12 files changed, 2886 insertions(+), 31 deletions(-)
> >>>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-hevc-data.c
> >>>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-hevc.c
> >>>
> >>
> >
>
>

