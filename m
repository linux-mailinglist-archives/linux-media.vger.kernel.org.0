Return-Path: <linux-media+bounces-1458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C5680057E
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 09:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61192281825
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC5B1A58E;
	Fri,  1 Dec 2023 08:27:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B9418B1A
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 08:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A45C433C8;
	Fri,  1 Dec 2023 08:27:50 +0000 (UTC)
Message-ID: <95aae707-bd3f-4a69-bb5f-194abe47e308@xs4all.nl>
Date: Fri, 1 Dec 2023 09:27:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] sync-with-kernel.sh: create v4l2-tracer patches
Content-Language: en-US, nl
To: Deborah Brouwer <deborah.brouwer@collabora.com>,
 linux-media@vger.kernel.org
References: <cover.1701388237.git.deborah.brouwer@collabora.com>
 <c8adf732788e3ab317024553c7b2137e3a541269.1701388238.git.deborah.brouwer@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <c8adf732788e3ab317024553c7b2137e3a541269.1701388238.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2023 01:12, Deborah Brouwer wrote:
> After v4l-utils is synced with the latest kernel headers, generate and
> apply patches for the changes that need to be made to the v4l2-tracer.
> This makes it easier to see how the kernel headers are changing the
> v4l2-tracer and also to revert those changes if necessary.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  sync-with-kernel.sh | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/sync-with-kernel.sh b/sync-with-kernel.sh
> index ad5681c6..dec90620 100755
> --- a/sync-with-kernel.sh
> +++ b/sync-with-kernel.sh
> @@ -115,8 +115,35 @@ function freebsd {
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
> +	TMPDIR=$(mktemp -d "${V4L2TRACERDIR}/v4l2-tracer-gen.XXXXXXXXXX")

Hmm, bash already has TMPDIR with a special meaning.

I think it is better to pick a different name to avoid confusion.

Regards,

	Hans

> +
> +	perl "${V4L2TRACERDIR}/v4l2-tracer-gen.pl" -o $TMPDIR $V4L2TRACERSOURCES
> +
> +	diff -Naur "${V4L2TRACERDIR}/trace-gen.cpp" "${TMPDIR}/trace-gen.cpp" > "${TMPDIR}/trace-gen.patch"
> +	diff -Naur "${V4L2TRACERDIR}/trace-gen.h" "${TMPDIR}/trace-gen.h" > "${TMPDIR}/trace-gen-h.patch"
> +	diff -Naur "${V4L2TRACERDIR}/retrace-gen.cpp" "${TMPDIR}/retrace-gen.cpp" > "${TMPDIR}/retrace-gen.patch"
> +	diff -Naur "${V4L2TRACERDIR}/retrace-gen.h" "${TMPDIR}/retrace-gen.h" > "${TMPDIR}/retrace-gen-h.patch"
> +	diff -Naur "${V4L2TRACERDIR}/v4l2-tracer-info-gen.h" "${TMPDIR}/v4l2-tracer-info-gen.h" > "${TMPDIR}/v4l2-tracer-info-gen-h.patch"
> +
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/trace-gen.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/trace-gen-h.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/retrace-gen.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/retrace-gen-h.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${TMPDIR}/v4l2-tracer-info-gen-h.patch
> +
> +	rm -r "$TMPDIR"
> +}
> +
>  keytable
>  libdvbv5
>  freebsd
>  ioctl-test
>  xc3028-firmware
> +v4l2-tracer


