Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E8133EE38
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 11:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhCQKVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 06:21:22 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:50493 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229590AbhCQKVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 06:21:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id MTIPlA4XWGEYcMTITlN5oE; Wed, 17 Mar 2021 11:21:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615976462; bh=2beQ9gCAZk+5jpnlJZDvaVwYxwAw4Coo0nn5UQ8s7xw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ABcHvFrnOwRFUMB1QJ+KEAoBKlmyXjlYM2Z0YR8qSWi7ul7dwppiXxI2xh/tIikfj
         W18cZVeWlDfgbkqzVpUwkCHkuYrEoedBYHei51I+gm8DkOUurqLig4bkRubW9LweIv
         C+4tIAw3FWqYWJvhzrGN4py+0+IGNBXQtcHC2PnlZvmbpxuiTGFzE5uiq6SfAsqury
         XgmU09SCzl4XxG4X165sOHEDchbpp1GboPNrxn9mwImn8IxT2cLw6MncFKcxjcqWdG
         xd2KyLLjnm5wGsucB7UDZxuqpAKu9fMy5vGLFIFIrlrBtxruZ1HBN0IW7SY1HqRWDL
         XkEGLsREa/cCQ==
Subject: Re: [PATCH] v4l2-compliance: Let uvcvideo return -EACCES
To:     Ricardo Ribalda <ricardo.ribalda@gmail.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ricardo@ribalda.com>
References: <20210315172531.101694-1-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <761d389d-fc36-2fdb-692e-1bc255bcab48@xs4all.nl>
Date:   Wed, 17 Mar 2021 11:20:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315172531.101694-1-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBq/4nMRIq4tMQQVXKZTNtzEN8VsBvo9v/irluPmGXUletP5y/yRuTWBdiIjpzqHgoHP0X/Kir0EG+M0ZpSTvNqHDd2kW/j7a3BuVmvnLixBMykv6Dj+
 8sozHIDRv0fL6bfnaVpikf909JO0uBH+KDuoPlfKfofw9L+1b24uosLUMW0OHr4QGzdPs+X0xL00XZ6ZknUGgdS+rKRwx9uJh5xQDVOHRbUjwPCDKJhQX2Tp
 lF1WHRF32r78dXmXT9qMY0Oet81uH1AMBNsPqpVziz58A+hETOo/0XDZMHTD6oF6iE9hJtKkIbrLyL7RJx4GyPKbhkrWHhOC2v3QSFL5Y1whoy/K5QVn7KRI
 4voaoyQlGB7bmpVGEl+IEVOq1BULBw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 18:25, Ricardo Ribalda wrote:
> Setting a control while inactive is meant to work, but it might
> not be actually written to the hardware until control becomes active.
> 
> v4l2-compliance should allow -EACCES as an error code, but only for
> the uvcdriver when an attempt is made to set inactive controls.
> 
> The control framework is able to handle this case more elegantly:
> it will remember the last set inactive value, and when the control
> becomes active it will update the hardware. But that's really hard
> to model in uvc.
> 
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp    |  2 ++
>  utils/v4l2-compliance/v4l2-compliance.h      |  1 +
>  utils/v4l2-compliance/v4l2-test-controls.cpp | 21 +++++++++++++++-----
>  3 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 9f71332c..1c21197b 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -84,6 +84,7 @@ bool show_colors;
>  bool exit_on_fail;
>  bool exit_on_warn;
>  bool is_vivid;
> +bool is_uvcvideo;
>  int media_fd = -1;
>  unsigned warnings;
>  
> @@ -958,6 +959,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  	if (node.is_v4l2()) {
>  		doioctl(&node, VIDIOC_QUERYCAP, &vcap);
>  		driver = reinterpret_cast<const char *>(vcap.driver);
> +		is_uvcvideo = driver == "uvcvideo";
>  		is_vivid = driver == "vivid";
>  		if (is_vivid)
>  			node.bus_info = reinterpret_cast<const char *>(vcap.bus_info);
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 4d5c3a5c..db4790a6 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -50,6 +50,7 @@ extern bool no_progress;
>  extern bool exit_on_fail;
>  extern bool exit_on_warn;
>  extern bool is_vivid; // We're testing the vivid driver
> +extern bool is_uvcvideo; // We're testing the uvc driver
>  extern int kernel_version;
>  extern int media_fd;
>  extern unsigned warnings;
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index 4be2f61c..70a8353a 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -485,6 +485,8 @@ int testSimpleControls(struct node *node)
>  		} else if (ret == EILSEQ) {
>  			warn("s_ctrl returned EILSEQ\n");
>  			ret = 0;
> +		} else if (ret == EACCES && is_uvcvideo) {
> +			ret = 0;
>  		} else if (ret) {
>  			return fail("s_ctrl returned an error (%d)\n", ret);
>  		}
> @@ -498,7 +500,8 @@ int testSimpleControls(struct node *node)
>  			ctrl.id = qctrl.id;
>  			ctrl.value = qctrl.minimum - 1;
>  			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
> -			if (ret && ret != EIO && ret != EILSEQ && ret != ERANGE)
> +			if (ret && ret != EIO && ret != EILSEQ && ret != ERANGE &&
> +			    !(ret == EACCES && is_uvcvideo))
>  				return fail("invalid minimum range check\n");
>  			if (!ret && checkSimpleCtrl(ctrl, qctrl))
>  				return fail("invalid control %08x\n", qctrl.id);
> @@ -508,7 +511,8 @@ int testSimpleControls(struct node *node)
>  			ctrl.id = qctrl.id;
>  			ctrl.value = qctrl.maximum + 1;
>  			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
> -			if (ret && ret != EIO && ret != EILSEQ && ret != ERANGE)
> +			if (ret && ret != EIO && ret != EILSEQ && ret != ERANGE &&
> +			    !(ret == EACCES && is_uvcvideo))
>  				return fail("invalid maximum range check\n");
>  			if (!ret && checkSimpleCtrl(ctrl, qctrl))
>  				return fail("invalid control %08x\n", qctrl.id);

For the 'if (qctrl.step > 1 && qctrl.maximum > qctrl.minimum) {' section an
EACCES check is also needed (it fails there for my Logitech webcam).

The same is true for the 'if (qctrl.type == V4L2_CTRL_TYPE_MENU || qctrl.type == V4L2_CTRL_TYPE_INTEGER_MENU) {'
section. Unfortunately, I don't have a uvc webcam that has an inactive menu.

Regards,

	Hans

> @@ -551,15 +555,18 @@ int testSimpleControls(struct node *node)
>  			ctrl.id = qctrl.id;
>  			ctrl.value = qctrl.minimum;
>  			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
> -			if (ret && ret != EIO && ret != EILSEQ)
> +			if (ret && ret != EIO && ret != EILSEQ &&
> +			    !(ret == EACCES && is_uvcvideo))
>  				return fail("could not set minimum value\n");
>  			ctrl.value = qctrl.maximum;
>  			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
> -			if (ret && ret != EIO && ret != EILSEQ)
> +			if (ret && ret != EIO && ret != EILSEQ &&
> +			    !(ret == EACCES && is_uvcvideo))
>  				return fail("could not set maximum value\n");
>  			ctrl.value = qctrl.default_value;
>  			ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
> -			if (ret && ret != EIO && ret != EILSEQ)
> +			if (ret && ret != EIO && ret != EILSEQ &&
> +			    !(ret == EACCES && is_uvcvideo))
>  				return fail("could not set default value\n");
>  		}
>  	}
> @@ -731,6 +738,8 @@ int testExtendedControls(struct node *node)
>  			} else if (ret == EILSEQ) {
>  				warn("s_ext_ctrls returned EILSEQ\n");
>  				ret = 0;
> +			} else if (ret == EACCES && is_uvcvideo) {
> +				ret = 0;
>  			}
>  			if (ret)
>  				return fail("s_ext_ctrls returned an error (%d)\n", ret);
> @@ -806,6 +815,8 @@ int testExtendedControls(struct node *node)
>  	} else if (ret == EILSEQ) {
>  		warn("s_ext_ctrls returned EILSEQ\n");
>  		ret = 0;
> +	} else if (ret == EACCES && is_uvcvideo) {
> +		ret = 0;
>  	}
>  	if (ret)
>  		return fail("could not set all controls\n");
> 

