Return-Path: <linux-media+bounces-1312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 751497FD18A
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A573D1C208FF
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511E212B7B;
	Wed, 29 Nov 2023 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F972125CE
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 09:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC66AC433C7;
	Wed, 29 Nov 2023 09:00:38 +0000 (UTC)
Message-ID: <c642a8b3-378a-4419-ad63-87b1c5d9d945@xs4all.nl>
Date: Wed, 29 Nov 2023 10:00:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] sync-with-kernel.sh: create v4l2-tracer patches
Content-Language: en-US, nl
To: Deborah Brouwer <deborah.brouwer@collabora.com>,
 linux-media@vger.kernel.org
References: <cover.1701114910.git.deborah.brouwer@collabora.com>
 <d470d99e37e94ad79ccc8888f0a1bec5f51d66c4.1701114910.git.deborah.brouwer@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <d470d99e37e94ad79ccc8888f0a1bec5f51d66c4.1701114910.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Deb,

On 27/11/2023 21:09, Deborah Brouwer wrote:
> After v4l-utils is synced with the latest kernel headers, generate and
> apply patches for the changes that need to be made to the v4l2-tracer.
> This makes it easier to see how the kernel headers are changing the
> v4l2-tracer and also to revert those changes if necessary.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  .gitignore          |  1 +
>  sync-with-kernel.sh | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index ef546cd4..fcd3d43b 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -2,3 +2,4 @@
>  patches/
>  build/
>  *.pc
> +v4l2-tracer-gen/

I don't really like adding a new directory just for the sync-with-kernel.sh bit.

> diff --git a/sync-with-kernel.sh b/sync-with-kernel.sh
> index ad5681c6..cd6c2b09 100755
> --- a/sync-with-kernel.sh
> +++ b/sync-with-kernel.sh
> @@ -115,8 +115,33 @@ function freebsd {
>  	quilt push -a
>  }
>  
> +function v4l2-tracer {
> +	V4L2TRACERDIR="${TOPSRCDIR}/utils/v4l2-tracer"
> +	V4L2TRACERSOURCES="${TOPSRCDIR}/include/linux/v4l2-controls.h "
> +	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/videodev2.h "
> +	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/media.h "
> +	V4L2TRACERSOURCES+="${TOPSRCDIR}/include/linux/v4l2-common.h "
> +
> +	mkdir -p $V4L2TRACERDIR/v4l2-tracer-gen

I would suggest using mktemp -d and also delete that directory + contents at the end.

> +
> +	perl "${V4L2TRACERDIR}/v4l2-tracer-gen.pl" -o $V4L2TRACERDIR/v4l2-tracer-gen $V4L2TRACERSOURCES
> +
> +	diff -Naur "${V4L2TRACERDIR}/trace-gen.cpp" "${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen.cpp" > "${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen.patch"
> +	diff -Naur "${V4L2TRACERDIR}/trace-gen.h" "${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen.h" > "${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen-h.patch"
> +	diff -Naur "${V4L2TRACERDIR}/retrace-gen.cpp" "${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen.cpp" > "${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen.patch"
> +	diff -Naur "${V4L2TRACERDIR}/retrace-gen.h" "${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen.h" > "${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen-h.patch"
> +	diff -Naur "${V4L2TRACERDIR}/v4l2-tracer-info-gen.h" "${V4L2TRACERDIR}/v4l2-tracer-gen/v4l2-tracer-info-gen.h" > "${V4L2TRACERDIR}/v4l2-tracer-gen/v4l2-tracer-info-gen-h.patch"
> +
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/trace-gen-h.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/retrace-gen-h.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERDIR}/v4l2-tracer-gen/v4l2-tracer-info-gen-h.patch
> +}
> +
>  keytable
>  libdvbv5
>  freebsd
>  ioctl-test
>  xc3028-firmware
> +v4l2-tracer

Otherwise this series makes a lot of sense.

Regards,

	Hans

