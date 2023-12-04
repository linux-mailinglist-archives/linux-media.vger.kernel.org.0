Return-Path: <linux-media+bounces-1527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9F802DC4
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 10:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33CED1C209AD
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF03125BE;
	Mon,  4 Dec 2023 09:04:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A89EADA
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 09:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBE8C433C7;
	Mon,  4 Dec 2023 09:04:07 +0000 (UTC)
Message-ID: <b2ffcc21-813f-48ec-9ade-210e5d24dca8@xs4all.nl>
Date: Mon, 4 Dec 2023 10:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] sync-with-kernel.sh: create v4l2-tracer patches
Content-Language: en-US, nl
To: Deborah Brouwer <deborah.brouwer@collabora.com>,
 linux-media@vger.kernel.org
References: <cover.1701450544.git.deborah.brouwer@collabora.com>
 <2f09965e148881405e6a029778ff887d459e65d3.1701450544.git.deborah.brouwer@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <2f09965e148881405e6a029778ff887d459e65d3.1701450544.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2023 18:13, Deborah Brouwer wrote:
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
> index ad5681c6..8c9106aa 100755
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
> +	V4L2TRACERTMPDIR=$(mktemp -d "${V4L2TRACERDIR}/v4l2-tracer-gen.XXXXXXXXXX")

That still doesn't work. This will now create a temp dir in V4L2TRACERDIR:

utils/v4l2-tracer/v4l2-tracer-gen.Jci48B9lCw/

That's not what you want either. If e.g. one of the patch commands fails, you'll
end up with an extra directory in utils/v4l2-tracer.

I've changed the line above to:

	V4L2TRACERTMPDIR=$(mktemp --tmpdir -d "v4l2-tracer-gen.XXXXXXXXXX")

That creates a temp dir in /tmp, which is what you want.

I'll take this, with the above change as it is not worth the effort doing a v4.

Note that you can even install a trap handler in this script that will delete the
directory in case of Ctrl-C, but that's overkill in this case. Besides, if something
goes wrong you might want to be able to look at the contents of V4L2TRACERTMPDIR.

Regards,

	Hans

> +
> +	perl "${V4L2TRACERDIR}/v4l2-tracer-gen.pl" -o $V4L2TRACERTMPDIR $V4L2TRACERSOURCES
> +
> +	diff -Naur "${V4L2TRACERDIR}/trace-gen.cpp" "${V4L2TRACERTMPDIR}/trace-gen.cpp" > "${V4L2TRACERTMPDIR}/trace-gen.patch"
> +	diff -Naur "${V4L2TRACERDIR}/trace-gen.h" "${V4L2TRACERTMPDIR}/trace-gen.h" > "${V4L2TRACERTMPDIR}/trace-gen-h.patch"
> +	diff -Naur "${V4L2TRACERDIR}/retrace-gen.cpp" "${V4L2TRACERTMPDIR}/retrace-gen.cpp" > "${V4L2TRACERTMPDIR}/retrace-gen.patch"
> +	diff -Naur "${V4L2TRACERDIR}/retrace-gen.h" "${V4L2TRACERTMPDIR}/retrace-gen.h" > "${V4L2TRACERTMPDIR}/retrace-gen-h.patch"
> +	diff -Naur "${V4L2TRACERDIR}/v4l2-tracer-info-gen.h" "${V4L2TRACERTMPDIR}/v4l2-tracer-info-gen.h" > "${V4L2TRACERTMPDIR}/v4l2-tracer-info-gen-h.patch"
> +
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/trace-gen.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/trace-gen-h.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/retrace-gen.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/retrace-gen-h.patch
> +	patch -d ${V4L2TRACERDIR} --no-backup-if-mismatch <${V4L2TRACERTMPDIR}/v4l2-tracer-info-gen-h.patch
> +
> +	rm -r "$V4L2TRACERTMPDIR"
> +}
> +
>  keytable
>  libdvbv5
>  freebsd
>  ioctl-test
>  xc3028-firmware
> +v4l2-tracer


