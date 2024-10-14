Return-Path: <linux-media+bounces-19625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8799D5BB
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 19:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 819F5285134
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C891C6F55;
	Mon, 14 Oct 2024 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EI5Gkrfy"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6F1BFE10;
	Mon, 14 Oct 2024 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728927810; cv=pass; b=ZuKHVjsa2jY4/Ox6uoG6RH57xgQXAD5+Aub8GW5DrzXFleSdrSIMfdOglq6zbK10XFLrYizor1SgoVsjVXC/xbLuMM3nmSXSNHc4pUgWjzjy6DRvibF+0s3EfLqvcYUSkk4+ltGbEPLZhkoXp24BdVpfGR10lB9msZXtpmUGDgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728927810; c=relaxed/simple;
	bh=CMQ5aEKoPJ8Yjt4bYFbMcMTcPpYh1IwTmFPdeQ0zY5Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ndFHJ119dn233YIZmrlvrGg0m9KIX8J+BL8i1Sn6Vuoxwhp9sRtaRXDNebvLJtKBc76bjrKsfYyiBpEZ0FNRK5YfEvGtHT0JlciniPE1hwsQgclcFHgWuF3MliIVQFf8D8MvGh1M9UBnK7CeDUwsZG55zLeuhCrYRJHXpV3IEhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=EI5Gkrfy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728927792; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eLCVRJdKExl6mMPF6kiha+MatIiJsh1lZkjUC29mWQp+BKyzQtYjaGjVda5Dv8dEK6Bz9g7t9vQ+mA72uG6JK630JtwPn+Mpt8RJnBMn1SEfQjkTNoQmQ/NCbtgP+ObI/5qE1/o6kHbCMAN7tRTYwDWlABsfCt6DYKQ8M6T7CIk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728927792; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MDhWxv3iV/paXTy7tIMf5UxS7BfHgZA0lyUUT/MwM7c=; 
	b=KL+z+sYDT1Yt7FaJKm+iy7wxF6RJdFwbJa9dGHKDv0a/UvBj7YhlVHK6pTIS3osTrTJTRVjJCUiLaOxeZyj1/ySLCyFs2dOGefkeZwx0tDDcXRQAcw34Y40psCDhDhhLG7OWsr1+idbdoXFvuO8Pl1bsJthvkuesAs2VCaRExuc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728927792;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=MDhWxv3iV/paXTy7tIMf5UxS7BfHgZA0lyUUT/MwM7c=;
	b=EI5GkrfyVnvJSE3zdbcNeatciL6LOato1ZkumWCJAWqiISMInpH4fsQyCJP0WDm5
	DsN60WFrVM6OYBkNe7Lg9RWY992M7izI7tWvDzbsBZB8R3H2upRKsH0ulKuOqACmtVK
	noZTK//UnhYHVYDDaxKWW4ylJ4HVyc1XOwXJiGMA=
Received: by mx.zohomail.com with SMTPS id 1728927790947967.650983391245;
	Mon, 14 Oct 2024 10:43:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH RFC v2 3/3] docs: media: Debugging guide for the media
 subsystem
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240529-b4-media_docs_improve-v2-3-66318b2da726@collabora.com>
Date: Mon, 14 Oct 2024 14:42:55 -0300
Cc: Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com,
 kernel@collabora.com,
 bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <666F7E2C-A44B-4B09-AF8E-D29138DFDBD3@collabora.com>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
 <20240529-b4-media_docs_improve-v2-3-66318b2da726@collabora.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-ZohoMailClient: External

Hi Sebastian,

> On 24 Sep 2024, at 05:45, Sebastian Fricke =
<sebastian.fricke@collabora.com> wrote:
>=20
> Create a guides section for all documentation material, that isn't
> strictly related to a specific piece of code.
>=20
> Provide a guide for developers on how to debug code with a focus on =
the
> media subsystem. This document aims to provide a rough overview over =
the
> possibilities and a rational to help choosing the right tool for the
> given circumstances.
>=20
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
> Documentation/media/guides/debugging_issues.rst | 174 =
++++++++++++++++++++++++
> Documentation/media/guides/index.rst            |  11 ++
> Documentation/media/index.rst                   |   1 +
> 3 files changed, 186 insertions(+)
>=20
> diff --git a/Documentation/media/guides/debugging_issues.rst =
b/Documentation/media/guides/debugging_issues.rst
> new file mode 100644
> index 000000000000..5f37801dd4ba
> --- /dev/null
> +++ b/Documentation/media/guides/debugging_issues.rst
> @@ -0,0 +1,174 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Debugging and tracing in the media subsystem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document serves as a starting point and lookup for debugging =
device
> +drivers in the media subsystem.
> +
> +.. contents::
> +    :depth: 3
> +
> +General debugging advice
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

> +
> +For general advice see the `general-debugging-guide =
<../../debugging/index.html>`__.
> +
> +Available tools
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +dev_debug module parameter
> +--------------------------
> +
> +For a general overview please see the =
`driver-development-debugging-guide =
<../../debugging/driver_development_debugging_guide.html>`__.
> +
> +Every video device provides a `dev_debug` parameter, which allows to =
get further insights into the IOCTLs in the background.
> +::
> +
> +  # cat /sys/class/video4linux/video3/name
> +  rkvdec
> +  # echo 0xff > /sys/class/video4linux/video3/dev_debug
> +  # dmesg -wH
> +  [...] videodev: v4l2_open: video3: open (0)
> +  [  +0.000036] video3: VIDIOC_QUERYCAP: driver=3Drkvdec, =
card=3Drkvdec, bus=3Dplatform:rkvdec, version=3D0x00060900, =
capabilities=3D0x84204000, device_caps=3D0x04204000
> +
> +`Full documentation =
<../../driver-api/media/v4l2-dev.html#video-device-debugging>`__
> +
> +dev_dbg / v4l2_dbg
> +------------------
> +
> +- Difference between both?
> +
> +  - v4l2_dbg utilizes v4l2_printk under the hood, which further uses =
printk directly, thus it cannot be targeted by dynamic debug
> +  - dev_dbg can be targeted by dynamic debug
> +  - v4l2_dbg has a more specific prefix format for the media =
subsystem, while dev_dbg only highlights the driver name and the =
location of the log
> +
> +Dynamic debug
> +-------------
> +
> +For general advice see the `userspace-debugging-guide =
<../../debugging/userspace_debugging_guide.html>`__.
> +
> +Here is one example, that enables all available `pr_debug()`'s within =
the file:
> +::
> +
> +  $ alias ddcmd=3D'echo $* > /proc/dynamic_debug/control'
> +  $ ddcmd '-p; file v4l2-h264.c +p'
> +  $ grep =3Dp /proc/dynamic_debug/control
> +   drivers/media/v4l2-core/v4l2-h264.c:372 =
[v4l2_h264]print_ref_list_b =3Dp "ref_pic_list_b%u (cur_poc %u%c) %s"
> +   drivers/media/v4l2-core/v4l2-h264.c:333 =
[v4l2_h264]print_ref_list_p =3Dp "ref_pic_list_p (cur_poc %u%c) %s\n"
> +
> +Ftrace
> +------
> +
> +For general advice see the `userspace-debugging-guide =
<../../debugging/userspace_debugging_guide.html>`__.
> +
> +Trace whenever the `rkvdec_try_ctrl` function is called
> +::
> +
> +  $ cd /sys/kernel/tracing
> +  $ echo function > /sys/kernel/tracing/current_tracer
> +  $ echo rkvdec_try_ctrl > set_ftrace_filter
> +  $ echo 1 > tracing_on
> +  $ cat trace
> +   h264parse0:sink-6359    [001] ...1. 172714.547523: rkvdec_try_ctrl =
<-try_or_set_cluster
> +   h264parse0:sink-6359    [005] ...1. 172714.567386: rkvdec_try_ctrl =
<-try_or_set_cluster
> +
> +Find out from where the calls originate
> +::
> +
> +  $ echo 1 > options/func_stack_trace
> +   h264parse0:sink-6715    [002] ..... 172837.967762: rkvdec_try_ctrl =
<-try_or_set_cluster
> +   h264parse0:sink-6715    [002] ..... 172837.967773: <stack trace>
> +   =3D> rkvdec_try_ctrl
> +   =3D> try_or_set_cluster
> +   =3D> try_set_ext_ctrls_common
> +   =3D> try_set_ext_ctrls
> +   =3D> v4l2_s_ext_ctrls
> +   =3D> v4l_s_ext_ctrls
> +   ...
> +   h264parse0:sink-6715    [004] ..... 172837.985747: rkvdec_try_ctrl =
<-try_or_set_cluster
> +   h264parse0:sink-6715    [004] ..... 172837.985750: <stack trace>
> +   =3D> rkvdec_try_ctrl
> +   =3D> try_or_set_cluster
> +   =3D> v4l2_ctrl_request_setup
> +   =3D> rkvdec_run_preamble
> +   =3D> rkvdec_h264_run
> +   =3D> rkvdec_device_run
> +   ...
> +
> +Trace the children of a function call and show the return values =
(requires config `FUNCTION_GRAPH_RETVAL`)
> +::
> +
> +  echo function_graph > current_tracer
> +  echo rkvdec_h264_run > set_graph_function
> +  echo 4 > max_graph_depth
> +  echo do_interrupt_handler mutex_* > set_graph_notrace
> +  echo 1 > options/funcgraph-retval
> +   ...
> +   4)               |  rkvdec_h264_run [rockchip_vdec]() {
> +   4)               |    v4l2_ctrl_find [videodev]() {
> +   ...
> +   4)               |    rkvdec_run_preamble [rockchip_vdec]() {
> +   4)   4.666 us    |      v4l2_m2m_next_buf [v4l2_mem2mem](); /* =3D =
0xffff000005782000 */
> +   ...
> +   4)               |      v4l2_ctrl_request_setup [videodev]() {
> +   4)   4.667 us    |        media_request_object_find [mc](); /* =3D =
0xffff000005e3aa98 */
> +   4)   1.750 us    |        find_ref [videodev](); /* =3D =
0xffff00000833b2a0 */
> +   ...
> +   4)   1.750 us    |      v4l2_m2m_buf_copy_metadata =
[v4l2_mem2mem](); /* =3D 0x0 */
> +   4) ! 114.333 us  |    } /* rkvdec_run_preamble [rockchip_vdec] =3D =
0x0 */
> +   4)   2.334 us    |    v4l2_h264_init_reflist_builder =
[v4l2_h264](); /* =3D 0x3e */
> +   ...
> +   4)               |    v4l2_h264_build_b_ref_lists [v4l2_h264]() {
> +   ...
> +   4)               |    rkvdec_run_postamble [rockchip_vdec]() {
> +   ...
> +   4) ! 444.208 us  |  } /* rkvdec_h264_run [rockchip_vdec] =3D 0x0 =
*/

Maybe have a look at retsnoop?=20

To me, a very frustrating and very common issue is having to figure out =
where
exactly an error code was generated. Ftrace helps a great deal, but I =
feel that
retsnoop just takes it a step further. On top of that, you can retrace =
the
execution on a statement level. =20

That is, with the right options, it can tell you exactly what statements
executed, which then lets you get very precise without any extra prints.

See [0]. There=E2=80=99s a talk on KR2024 about it too [1].


[0]: https://github.com/anakryiko/retsnoop

[1]: https://www.youtube.com/watch?v=3DNvTBrx6EdF8=20

=E2=80=94 Daniel=

