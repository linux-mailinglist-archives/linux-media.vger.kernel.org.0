Return-Path: <linux-media+bounces-50535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE6DD17C2E
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E5D7300518B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E71387580;
	Tue, 13 Jan 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYQZfyi9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2445730F949
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768297752; cv=none; b=f7aFX+HhwHfNxUGNNT7EfIqhh5GYsfXaGnGmgLrtgynXS5h/xV97wXARDYecrPxjQJ3+toKTaz2Kt3izS6gC8HubZrNw9MF+iAx9YDpEqmszsUJXUSCnq1aOU4mCap19CEOobIKQY7na0YKpgFLTsSAhpcApXjnnuvTvTr+BNbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768297752; c=relaxed/simple;
	bh=t16MOwJVwntgctqGxi54hMcivJFqU7nlXY3p4laGqhA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=GSr5n7uYYNmkXtNhtYMsrbQm4K1vRNUFkkWlXWLzdS6b0AjFCQNphyhBcM1G9aANlaopACj6jda4Ch8A/1QLIStwNFzckG9JE/vRQb9ltjwL0nIWix2tyTCq22wujcCPt1Lfvxc0j6ys/qSKfY7H5EMba6DY32DjhkEdBYMpJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYQZfyi9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317EFC116C6;
	Tue, 13 Jan 2026 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768297751;
	bh=t16MOwJVwntgctqGxi54hMcivJFqU7nlXY3p4laGqhA=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=sYQZfyi9QoDRgqWUI8SuFBkjgvTolfpKYXZx/rfxbUfsDffUfV+f9wndLBDAgK0wF
	 1W52Qkgs/lOA/B4dbaDOf/MQXh8qoicxkaOVWq9SNqr6p3cOHN2/WnB0QXjXz43MTb
	 YD0YikfypJl/iSzNfKthRBSin2ygV1Q0520UOZK1AaT74gxXhYV8yQ1Apv+N1UDoUp
	 zbZFt77uhXyLUbg6f9XFGkxYpXrn+AsKNg/jqbabwgIQZhFpqNXCMRC4CM5DhtEH3T
	 yb8z+ipAKbZrYlW0JR7znkT15eACpK8+hbdvHV+U/NZfs7ycA68xQom5SGfG6gB+uZ
	 GlSCiDwWJ8Epg==
Message-ID: <dceb8477-c4f6-45ff-8f79-2491a992e905@kernel.org>
Date: Tue, 13 Jan 2026 10:49:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] v4l2-tracer: unique_ptr conversions
To: Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20251123210231.11605-1-rosenp@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20251123210231.11605-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rosen,

Thank you for this patch, but it fails to apply.

The problem is this change:

> -struct v4l2_streamparm *retrace_v4l2_streamparm(json_object *parent_obj, const std::string& key_name = "")
> +std::unique_ptr<v4l2_streamparm> retrace_v4l2_streamparm(json_object *parent_obj, const std::string& key_name = "")

Currently retrace_v4l2_streamparm doesn't have 'const' for key_name.

I suspect that there is a patch missing that needs to go in before this one.

Regards,

	Hans

On 23/11/2025 22:02, Rosen Penev wrote:
> No need to manually free.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/v4l2-tracer/retrace.cpp | 84 +++++++++++++----------------------
>  1 file changed, 32 insertions(+), 52 deletions(-)
> 
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
> index d65ecd3d..8419b2ce 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -5,6 +5,8 @@
>  
>  #include "retrace.h"
>  
> +#include <memory>
> +
>  extern struct retrace_context ctx_retrace;
>  
>  void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
> @@ -226,9 +228,9 @@ struct v4l2_plane *retrace_v4l2_plane(json_object *plane_obj, __u32 memory)
>  	return ptr;
>  }
>  
> -struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
> +std::unique_ptr<v4l2_buffer> retrace_v4l2_buffer(json_object *ioctl_args)
>  {
> -	struct v4l2_buffer *buf = (struct v4l2_buffer *) calloc(1, sizeof(struct v4l2_buffer));
> +	std::unique_ptr<v4l2_buffer> buf(new v4l2_buffer{});
>  
>  	json_object *buf_obj;
>  	json_object_object_get_ex(ioctl_args, "v4l2_buffer", &buf_obj);
> @@ -311,9 +313,9 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object *ioctl_args)
>  
>  void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
> +	auto buf = retrace_v4l2_buffer(ioctl_args);
>  
> -	ioctl(fd_retrace, VIDIOC_QUERYBUF, buf);
> +	ioctl(fd_retrace, VIDIOC_QUERYBUF, buf.get());
>  
>  	if (buf->memory == V4L2_MEMORY_MMAP) {
>  		__u32 offset = 0;
> @@ -342,15 +344,13 @@ void retrace_vidioc_querybuf(int fd_retrace, json_object *ioctl_args)
>  		debug_line_info();
>  		print_context();
>  	}
> -
> -	free(buf);
>  }
>  
>  void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_buffer *ptr = retrace_v4l2_buffer(ioctl_args);
> +	auto ptr = retrace_v4l2_buffer(ioctl_args);
>  
> -	ioctl(fd_retrace, VIDIOC_QBUF, ptr);
> +	ioctl(fd_retrace, VIDIOC_QBUF, ptr.get());
>  
>  	if (ptr->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
>  	    ptr->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> @@ -367,13 +367,11 @@ void retrace_vidioc_qbuf(int fd_retrace, json_object *ioctl_args)
>  		debug_line_info();
>  		print_context();
>  	}
> -
> -	free(ptr);
>  }
>  
>  void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
> +	auto buf = retrace_v4l2_buffer(ioctl_args);
>  
>  	const int poll_timeout_ms = 5000;
>  	struct pollfd *pfds = (struct pollfd *) calloc(1, sizeof(struct pollfd));
> @@ -393,7 +391,7 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args)
>  		exit(EXIT_FAILURE);
>  	}
>  
> -	ioctl(fd_retrace, VIDIOC_DQBUF, buf);
> +	ioctl(fd_retrace, VIDIOC_DQBUF, buf.get());
>  
>  	if (is_verbose() || (errno != 0)) {
>  		fprintf(stderr, "%s, index: %d, fd: %d, ",
> @@ -407,15 +405,13 @@ void retrace_vidioc_dqbuf(int fd_retrace, json_object *ioctl_args)
>  	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
>  	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>  			free(buf->m.planes);
> -
> -	free(buf);
>  }
>  
>  void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_buffer *buf = retrace_v4l2_buffer(ioctl_args);
> +	auto buf = retrace_v4l2_buffer(ioctl_args);
>  
> -	ioctl(fd_retrace, VIDIOC_PREPARE_BUF, buf);
> +	ioctl(fd_retrace, VIDIOC_PREPARE_BUF, buf.get());
>  
>  	if (is_verbose() || (errno != 0)) {
>  		fprintf(stderr, "%s, index: %d, fd: %d, ",
> @@ -429,8 +425,6 @@ void retrace_vidioc_prepare_buf(int fd_retrace, json_object *ioctl_args)
>  	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
>  	    buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>  			free(buf->m.planes);
> -
> -	free(buf);
>  }
>  
>  void retrace_vidioc_create_bufs(int fd_retrace, json_object *ioctl_args)
> @@ -541,9 +535,9 @@ void retrace_vidioc_s_fmt(int fd_retrace, json_object *ioctl_args)
>  	free(ptr);
>  }
>  
> -struct v4l2_streamparm *retrace_v4l2_streamparm(json_object *parent_obj, const std::string& key_name = "")
> +std::unique_ptr<v4l2_streamparm> retrace_v4l2_streamparm(json_object *parent_obj, const std::string& key_name = "")
>  {
> -	struct v4l2_streamparm *ptr = (struct v4l2_streamparm *) calloc(1, sizeof(v4l2_streamparm));
> +	std::unique_ptr<v4l2_streamparm> ptr(new v4l2_streamparm{});
>  
>  	json_object *v4l2_streamparm_obj;
>  	json_object_object_get_ex(parent_obj, "v4l2_streamparm", &v4l2_streamparm_obj);
> @@ -563,24 +557,20 @@ struct v4l2_streamparm *retrace_v4l2_streamparm(json_object *parent_obj, const s
>  
>  void retrace_vidioc_g_parm (int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_streamparm *ptr = retrace_v4l2_streamparm(ioctl_args);
> -	ioctl(fd_retrace, VIDIOC_G_PARM, ptr);
> +	auto ptr = retrace_v4l2_streamparm(ioctl_args);
> +	ioctl(fd_retrace, VIDIOC_G_PARM, ptr.get());
>  
>  	if (is_verbose() || (errno != 0))
>  		perror("VIDIOC_G_PARM");
> -
> -	free(ptr);
>  }
>  
>  void retrace_vidioc_s_parm (int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_streamparm *ptr = retrace_v4l2_streamparm(ioctl_args);
> -	ioctl(fd_retrace, VIDIOC_S_PARM, ptr);
> +	auto ptr = retrace_v4l2_streamparm(ioctl_args);
> +	ioctl(fd_retrace, VIDIOC_S_PARM, ptr.get());
>  
>  	if (is_verbose() || (errno != 0))
>  		perror("VIDIOC_S_PARM");
> -
> -	free(ptr);
>  }
>  
>  void retrace_vidioc_queryctrl(int fd_retrace, json_object *ioctl_args)
> @@ -897,9 +887,9 @@ struct v4l2_ext_control *retrace_v4l2_ext_control(json_object *parent_obj, int c
>  	return p;
>  }
>  
> -struct v4l2_ext_controls *retrace_v4l2_ext_controls(json_object *parent_obj)
> +std::unique_ptr<v4l2_ext_controls> retrace_v4l2_ext_controls(json_object *parent_obj)
>  {
> -	struct v4l2_ext_controls *ptr = (struct v4l2_ext_controls *) calloc(1, sizeof(v4l2_ext_controls));
> +	std::unique_ptr<v4l2_ext_controls> ptr(new v4l2_ext_controls{});
>  
>  	json_object *v4l2_ext_controls_obj;
>  	json_object_object_get_ex(parent_obj, "v4l2_ext_controls", &v4l2_ext_controls_obj);
> @@ -948,10 +938,8 @@ struct v4l2_ext_controls *retrace_v4l2_ext_controls(json_object *parent_obj)
>  
>  void retrace_vidioc_try_ext_ctrls(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
> -	ioctl(fd_retrace, VIDIOC_TRY_EXT_CTRLS, ptr);
> -
> -	free(ptr);
> +	auto ptr = retrace_v4l2_ext_controls(ioctl_args);
> +	ioctl(fd_retrace, VIDIOC_TRY_EXT_CTRLS, ptr.get());
>  
>  	if (is_verbose() || (errno != 0))
>  		perror("VIDIOC_TRY_EXT_CTRLS");
> @@ -959,10 +947,8 @@ void retrace_vidioc_try_ext_ctrls(int fd_retrace, json_object *ioctl_args)
>  
>  void retrace_vidioc_g_ext_ctrls(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
> -	ioctl(fd_retrace, VIDIOC_G_EXT_CTRLS, ptr);
> -
> -	free(ptr);
> +	auto ptr = retrace_v4l2_ext_controls(ioctl_args);
> +	ioctl(fd_retrace, VIDIOC_G_EXT_CTRLS, ptr.get());
>  
>  	if (is_verbose() || (errno != 0))
>  		perror("VIDIOC_G_EXT_CTRLS");
> @@ -970,10 +956,8 @@ void retrace_vidioc_g_ext_ctrls(int fd_retrace, json_object *ioctl_args)
>  
>  void retrace_vidioc_s_ext_ctrls(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_ext_controls *ptr = retrace_v4l2_ext_controls(ioctl_args);
> -	ioctl(fd_retrace, VIDIOC_S_EXT_CTRLS, ptr);
> -
> -	free(ptr);
> +	auto ptr = retrace_v4l2_ext_controls(ioctl_args);
> +	ioctl(fd_retrace, VIDIOC_S_EXT_CTRLS, ptr.get());
>  
>  	if (is_verbose() || (errno != 0)) {
>  		perror("VIDIOC_S_EXT_CTRLS");
> @@ -1056,9 +1040,9 @@ void retrace_vidioc_s_selection(int fd_retrace, json_object *ioctl_args)
>  	free(ptr);
>  }
>  
> -struct v4l2_decoder_cmd *retrace_v4l2_decoder_cmd(json_object *parent_obj)
> +std::unique_ptr<v4l2_decoder_cmd> retrace_v4l2_decoder_cmd(json_object *parent_obj)
>  {
> -	struct v4l2_decoder_cmd *ptr = (struct v4l2_decoder_cmd *) calloc(1, sizeof(v4l2_decoder_cmd));
> +	std::unique_ptr<v4l2_decoder_cmd> ptr(new v4l2_decoder_cmd{});
>  
>  	json_object *v4l2_decoder_cmd_obj;
>  	json_object_object_get_ex(parent_obj, "v4l2_decoder_cmd", &v4l2_decoder_cmd_obj);
> @@ -1121,14 +1105,12 @@ struct v4l2_decoder_cmd *retrace_v4l2_decoder_cmd(json_object *parent_obj)
>  
>  void retrace_vidioc_try_decoder_cmd(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_decoder_cmd *ptr = retrace_v4l2_decoder_cmd(ioctl_args);
> +	auto ptr = retrace_v4l2_decoder_cmd(ioctl_args);
>  
> -	ioctl(fd_retrace, VIDIOC_TRY_DECODER_CMD, ptr);
> +	ioctl(fd_retrace, VIDIOC_TRY_DECODER_CMD, ptr.get());
>  
>  	if (is_verbose() || (errno != 0))
>  		perror("VIDIOC_TRY_DECODER_CMD");
> -
> -	free (ptr);
>  }
>  
>  void retrace_vidioc_dqevent(int fd_retrace)
> @@ -1188,14 +1170,12 @@ void retrace_vidioc_unsubscribe(int fd_retrace, json_object *ioctl_args)
>  
>  void retrace_vidioc_decoder_cmd(int fd_retrace, json_object *ioctl_args)
>  {
> -	struct v4l2_decoder_cmd *ptr = retrace_v4l2_decoder_cmd(ioctl_args);
> +	auto ptr = retrace_v4l2_decoder_cmd(ioctl_args);
>  
> -	ioctl(fd_retrace, VIDIOC_DECODER_CMD, ptr);
> +	ioctl(fd_retrace, VIDIOC_DECODER_CMD, ptr.get());
>  
>  	if (is_verbose() || (errno != 0))
>  		perror("VIDIOC_DECODER_CMD");
> -
> -	free (ptr);
>  }
>  
>  void retrace_vidioc_query_ext_ctrl(int fd_retrace, json_object *ioctl_args)


