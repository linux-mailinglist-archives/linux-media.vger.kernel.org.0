Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AADF1ABBC7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 10:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503017AbgDPIzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 04:55:12 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:33739 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2502539AbgDPIxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 04:53:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id P0H4jxyAClKa1P0H8jRAHU; Thu, 16 Apr 2020 10:53:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587027214; bh=9WOEBGbhNWTWcb5wWzuotRMRLjvovmKy5rtSmeTedTE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SEl8P7G0mwLjPn9eWvjTiuFGw9iZ9bwnWPqwuuazeuv3r43hYnswxzm41g9wNxa+U
         e4IUhAzkpkS66FA/oMPQLwd6ulJu0gQrVNuDwuKnXZpxKi6pKgQKLDVxdVlW5VRptK
         GgjuG6WfoFAl+7fC0d8FkVoehar11oQ7rkKLj6oKFYJ+8UifmnS5vksGi76DjBCit6
         cDsmB9DzHs9fsJCPsXEZgfzEblGtfIclWnliZuE4mylLk5Fa40aqW3vltCBLo1JOZB
         EVMJc0P3GhX09ZY0eXIdLatoUJ8WbCLsmtHhtWZrriZckxav7p9OmZj8ZB9OmGJekx
         k057i3p4wqpag==
Subject: Re: [RFC][PATCH] media: v4l2-ctrls: add more NULL pointer checks
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200410103501.1083-1-sergey.senozhatsky@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c83c137b-b801-a06b-e324-09dd3bbc9daf@xs4all.nl>
Date:   Thu, 16 Apr 2020 10:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200410103501.1083-1-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfItyTbJnDaB/ZbLYq9psKWKGdq8VZJMWZrpzkMWGM3MDByU7HQUSBJPT+xx9RsksERX5vxKaNk8MaySiZ4I25tEZPj+5I8bLyDs59SPC0tQPCc1MZMDc
 L8ZzLkp6GqUPRsqTPxhtL9doDwFst25nWB54a+CXavr2AqJXAknHGz/RxiP8lKdacuAx+zw54ZY3qMKXtmz4JLVav8CESRbZws/2pax5mNmF966wPIw7Nw/m
 mcuy54Gp82EgRhJLdd/mtfSeHSZ/wsw+Yez7T2zKWdnX8yrn8SSSmuGnoQ373i6VwCJjIsLUDNCLj+llpEqsTMwEalry8tqy1fJGiOmyAO8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/04/2020 12:35, Sergey Senozhatsky wrote:
> A number of v4l2-ctrls functions gracefully handle NULL ctrl pointers,
> for instance, v4l2_g_ctrl(), v4l2_ctrl_activate(), __v4l2_ctrl_grab()
> to name a few. But not all of them. It is relatively easy to crash the
> kernel with the NULL pointer dereference:
> 
> 	# modprobe vivid node_types=0x60000
> 	$ v4l2-compliance
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000020
> PF: supervisor read access in kernel mode
> PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0
> Oops: 0000 [#1] SMP PTI
> RIP: 0010:v4l2_ctrl_s_ctrl.isra.0+0x4/0x30 [vivid]
> Call Trace:
>  vidioc_s_input.cold+0x1a8/0x38d [vivid]
>  __video_do_ioctl+0x372/0x3a0 [videodev]
>  ? v4l_enumstd+0x20/0x20 [videodev]
>  ? v4l_enumstd+0x20/0x20 [videodev]
>  video_usercopy+0x1cb/0x450 [videodev]
>  v4l2_ioctl+0x3f/0x50 [videodev]
>  ksys_ioctl+0x3f1/0x7e0
>  ? vfs_write+0x1c4/0x1f0
>  __x64_sys_ioctl+0x11/0x20
>  do_syscall_64+0x49/0x2c0
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> vivid driver crashes the kernel in various places, for instance,
> 
> 	v4l2_ctrl_modify_range(dev->brightness, ...);
> or
> 	v4l2_ctrl_s_ctrl(dev->brightness, ...);
> 
> because ->brightness (and quite likely some more controls) is NULL.
> While we may fix the vivid driver, it would be safer to fix core
> API. This patch adds more NULL pointer checks to ctrl API.
> 
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 22 ++++++++++++++++-
>  include/media/v4l2-ctrls.h           | 37 ++++++++++++++++++++++++++--
>  2 files changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 93d33d1db4e8..02a60f67c2ee 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -2869,6 +2869,9 @@ EXPORT_SYMBOL(v4l2_ctrl_add_handler);
>  
>  bool v4l2_ctrl_radio_filter(const struct v4l2_ctrl *ctrl)
>  {
> +	if (WARN_ON(!ctrl))
> +		return false;
> +
>  	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_TX)
>  		return true;
>  	if (V4L2_CTRL_ID2WHICH(ctrl->id) == V4L2_CTRL_CLASS_FM_RX)
> @@ -3794,7 +3797,9 @@ s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl)
>  	struct v4l2_ext_control c;
>  
>  	/* It's a driver bug if this happens. */
> -	WARN_ON(!ctrl->is_int);
> +	if (WARN_ON(!ctrl || !ctrl->is_int))
> +		return -EINVAL;

Just return 0 here. The return value is the control's value, not an error code.
So all you can do here is return 0 in the absence of anything better.

> +
>  	c.value = 0;
>  	get_ctrl(ctrl, &c);
>  	return c.value;
> @@ -4212,6 +4217,9 @@ EXPORT_SYMBOL(v4l2_s_ctrl);
>  
>  int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
>  {
> +	if (!ctrl)

Change this to 'if (WARN_ON(!ctrl))'

I don't think NULL pointers should be silently ignored: it really
indicates a driver bug. It it certainly a good idea to WARN instead.

The same is true for the functions below.

That means that vivid should be fixed as well, but at least it should
just WARN instead of crashing, that's certainly a good improvement.

Regards,

	Hans

> +		return -EINVAL;
> +
>  	lockdep_assert_held(ctrl->handler->lock);
>  
>  	/* It's a driver bug if this happens. */
> @@ -4223,6 +4231,9 @@ EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl);
>  
>  int __v4l2_ctrl_s_ctrl_int64(struct v4l2_ctrl *ctrl, s64 val)
>  {
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	lockdep_assert_held(ctrl->handler->lock);
>  
>  	/* It's a driver bug if this happens. */
> @@ -4234,6 +4245,9 @@ EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_int64);
>  
>  int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>  {
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	lockdep_assert_held(ctrl->handler->lock);
>  
>  	/* It's a driver bug if this happens. */
> @@ -4246,6 +4260,9 @@ EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
>  int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
>  			    const struct v4l2_area *area)
>  {
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	lockdep_assert_held(ctrl->handler->lock);
>  
>  	/* It's a driver bug if this happens. */
> @@ -4447,6 +4464,9 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>  	bool range_changed = false;
>  	int ret;
>  
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	lockdep_assert_held(ctrl->handler->lock);
>  
>  	switch (ctrl->type) {
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 7db9e719a583..22d7ea500f96 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -755,6 +755,8 @@ int v4l2_ctrl_add_handler(struct v4l2_ctrl_handler *hdl,
>   * transmitter class controls.
>   *
>   * This function is to be used with v4l2_ctrl_add_handler().
> + *
> + * Returns false if ctrl == NULL.
>   */
>  bool v4l2_ctrl_radio_filter(const struct v4l2_ctrl *ctrl);
>  
> @@ -884,7 +886,7 @@ static inline void v4l2_ctrl_grab(struct v4l2_ctrl *ctrl, bool grabbed)
>   * @step value is interpreted as a menu_skip_mask.
>   *
>   * An error is returned if one of the range arguments is invalid for this
> - * control type.
> + * control type. Returns -EINVAL if ctrl == NULL.
>   *
>   * The caller is responsible for acquiring the control handler mutex on behalf
>   * of __v4l2_ctrl_modify_range().
> @@ -906,7 +908,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>   * @step value is interpreted as a menu_skip_mask.
>   *
>   * An error is returned if one of the range arguments is invalid for this
> - * control type.
> + * control type. Returns -EINVAL if ctrl == NULL.
>   *
>   * This function assumes that the control handler is not locked and will
>   * take the lock itself.
> @@ -916,6 +918,9 @@ static inline int v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>  {
>  	int rval;
>  
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	v4l2_ctrl_lock(ctrl);
>  	rval = __v4l2_ctrl_modify_range(ctrl, min, max, step, def);
>  	v4l2_ctrl_unlock(ctrl);
> @@ -982,6 +987,8 @@ const s64 *v4l2_ctrl_get_int_menu(u32 id, u32 *len);
>   * used from within the &v4l2_ctrl_ops functions.
>   *
>   * This function is for integer type controls only.
> + *
> + * Returns -EINVAL if ctrl == NULL.
>   */
>  s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl);
>  
> @@ -996,6 +1003,8 @@ s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl);
>   * allowing it to be used from within the &v4l2_ctrl_ops functions.
>   *
>   * This function is for integer type controls only.
> + *
> + * Returns -EINVAL is ctrl == NULL.
>   */
>  int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val);
>  
> @@ -1010,11 +1019,16 @@ int __v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val);
>   * used from within the &v4l2_ctrl_ops functions.
>   *
>   * This function is for integer type controls only.
> + *
> + * Return -EINVAL is ctrl == NULL.
>   */
>  static inline int v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
>  {
>  	int rval;
>  
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	v4l2_ctrl_lock(ctrl);
>  	rval = __v4l2_ctrl_s_ctrl(ctrl, val);
>  	v4l2_ctrl_unlock(ctrl);
> @@ -1062,11 +1076,16 @@ int __v4l2_ctrl_s_ctrl_int64(struct v4l2_ctrl *ctrl, s64 val);
>   * used from within the &v4l2_ctrl_ops functions.
>   *
>   * This function is for 64-bit integer type controls only.
> + *
> + * Returns -EINVAL if ctrl == NULL.
>   */
>  static inline int v4l2_ctrl_s_ctrl_int64(struct v4l2_ctrl *ctrl, s64 val)
>  {
>  	int rval;
>  
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	v4l2_ctrl_lock(ctrl);
>  	rval = __v4l2_ctrl_s_ctrl_int64(ctrl, val);
>  	v4l2_ctrl_unlock(ctrl);
> @@ -1085,6 +1104,8 @@ static inline int v4l2_ctrl_s_ctrl_int64(struct v4l2_ctrl *ctrl, s64 val)
>   * allowing it to be used from within the &v4l2_ctrl_ops functions.
>   *
>   * This function is for string type controls only.
> + *
> + * Returns -EINVAL if ctrl == NULL.
>   */
>  int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s);
>  
> @@ -1100,11 +1121,16 @@ int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s);
>   * used from within the &v4l2_ctrl_ops functions.
>   *
>   * This function is for string type controls only.
> + *
> + * Returns -EINVAL if ctrl == NULL.
>   */
>  static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>  {
>  	int rval;
>  
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	v4l2_ctrl_lock(ctrl);
>  	rval = __v4l2_ctrl_s_ctrl_string(ctrl, s);
>  	v4l2_ctrl_unlock(ctrl);
> @@ -1123,6 +1149,8 @@ static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>   * allowing it to be used from within the &v4l2_ctrl_ops functions.
>   *
>   * This function is for area type controls only.
> + *
> + * Returns -EINVAL if ctrl == NULL.
>   */
>  int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
>  			    const struct v4l2_area *area);
> @@ -1139,12 +1167,17 @@ int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
>   * used from within the &v4l2_ctrl_ops functions.
>   *
>   * This function is for area type controls only.
> + *
> + * Returns -EINVAL if ctrl == NULL.
>   */
>  static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
>  					const struct v4l2_area *area)
>  {
>  	int rval;
>  
> +	if (!ctrl)
> +		return -EINVAL;
> +
>  	v4l2_ctrl_lock(ctrl);
>  	rval = __v4l2_ctrl_s_ctrl_area(ctrl, area);
>  	v4l2_ctrl_unlock(ctrl);
> 

