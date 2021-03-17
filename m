Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F07733F1BE
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 14:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhCQNuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 09:50:06 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45183 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231579AbhCQNtn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 09:49:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id MWYLlB8mRGEYcMWYPlNd6H; Wed, 17 Mar 2021 14:49:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615988981; bh=jLsq57TkKhYqPG547LmId5c+9WcEqtNi14NVClHr2G4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Rlh1LfBQ/q8y1vV5/uym95TUyjdV3KEN4xDItEAznijihwgbk8rtJwd1EOcdTbmX9
         YafW+JgRjv2IN0wNK9k30B3PlnLVyD4FFP9w68kz6bftBa1SuyGpk78/frSoBwMAik
         MAL2iutgEaFw6kWZdxWLgAuWNCT5j2dwtiFpKIwkjRtZGSH6/dbs4d9wnAjSCYMEvK
         WM4ifYCNrsqJ1ga2l/UkUCfSutHSB0tR9iYS4WhJizZ/Sp6r9OBRclLMBkcqRr2WVA
         uSzPFeH7l9F02UUwctjzYu0KuOCyEgfFuXEgqnkLxYSrq8xe9/XepGUrAoXrufa4B/
         Ie+C3VYActKuA==
Subject: Re: [PATCH v2] v4l2-compliance: Let uvcvideo return -EACCES
To:     Ricardo Ribalda <ricardo.ribalda@gmail.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Ricardo Ribalda <ricardo@ribalda.com>
References: <20210317120812.292261-1-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ea43d066-107d-9b97-c9f7-0797b7aeab9d@xs4all.nl>
Date:   Wed, 17 Mar 2021 14:49:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317120812.292261-1-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfITXpp4jNARFJprc6zopb6ripGOyXjk7Pd5DcvAXlVmfQzelQNkPINDuomymjAbSwjJGmIH5U9yugWIGdCnPk0mOAlElhqHPT2vQcdk+1iI/wcIYJOd5
 qj4fAm2fgvJQssVKx4OLpbzyxvGcmZ7v3ZGoHQRlYDrXA72dbaNS20z8EWJVW2VIyGn7+ZLFgy5tIvYo9uTAY8HOOOqz+uK9oSW+L3WuYSfMvrZgQIgjiKNi
 sK8pnlaZFB9++LqFGyhPbUPgwdYIwjBvudZfvxgassbz/zWqmMC7dXWYlzbKbxNOmEG75ia4837SsPEee02nBatZzwv5IFVqN0JKH2bj9aIJDddRE3y2fBSV
 05h7/ovk
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2021 13:08, Ricardo Ribalda wrote:
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
> 
> Changelog v2:
> - Also fix MENU and INTEGER_MENU
> 
>  utils/v4l2-compliance/v4l2-compliance.cpp    |  2 ++
>  utils/v4l2-compliance/v4l2-compliance.h      |  1 +
>  utils/v4l2-compliance/v4l2-test-controls.cpp | 23 +++++++++++++++-----
>  3 files changed, 21 insertions(+), 5 deletions(-)
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
> index 4be2f61c..511a76a5 100644
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

You missed updating this:

For the 'if (qctrl.step > 1 && qctrl.maximum > qctrl.minimum) {' section an
EACCES check is also needed (it fails there for my Logitech webcam).

So:

                        if (ret == ERANGE)
                                warn("%s: returns ERANGE for in-range, but non-step-multiple value\n",
                                                qctrl.name);
                        else if (ret && ret != EIO && ret != EILSEQ)
                                return fail("returns error for in-range, but non-step-multiple value\n");

should be:

                        if (ret == ERANGE)
                                warn("%s: returns ERANGE for in-range, but non-step-multiple value\n",
                                                qctrl.name);
                        else if (ret && ret != EIO && ret != EILSEQ &&
				 !(ret == EACCES && is_uvcvideo))
                                return fail("returns error for in-range, but non-step-multiple value\n");

Regards,

	Hans

> @@ -539,6 +543,8 @@ int testSimpleControls(struct node *node)
>  				ctrl.id = qctrl.id;
>  				ctrl.value = i;
>  				ret = doioctl(node, VIDIOC_S_CTRL, &ctrl);
> +				if (valid && ret == EACCES && is_uvcvideo)
> +					continue;
>  				if (valid && ret)
>  					return fail("could not set valid menu item %d\n", i);
>  				if (!valid && !ret)
> @@ -551,15 +557,18 @@ int testSimpleControls(struct node *node)
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
> @@ -731,6 +740,8 @@ int testExtendedControls(struct node *node)
>  			} else if (ret == EILSEQ) {
>  				warn("s_ext_ctrls returned EILSEQ\n");
>  				ret = 0;
> +			} else if (ret == EACCES && is_uvcvideo) {
> +				ret = 0;
>  			}
>  			if (ret)
>  				return fail("s_ext_ctrls returned an error (%d)\n", ret);
> @@ -806,6 +817,8 @@ int testExtendedControls(struct node *node)
>  	} else if (ret == EILSEQ) {
>  		warn("s_ext_ctrls returned EILSEQ\n");
>  		ret = 0;
> +	} else if (ret == EACCES && is_uvcvideo) {
> +		ret = 0;
>  	}
>  	if (ret)
>  		return fail("could not set all controls\n");
> 

