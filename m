Return-Path: <linux-media+bounces-45928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 110FAC1956E
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 10:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBF8B505D1F
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 09:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BEC311C2F;
	Wed, 29 Oct 2025 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmTqtfsn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0993F156230
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761729043; cv=none; b=A250I5Cmm/70ZuNi6xVMS8rwp4bGNLHBcQ6Gl/8IHqqmexBnohkDT3otWa7Li/El7LprEu5OqhvYt8uSM5MOcqXNkxp6ZkoL3cnA+1O6qwH92A0WlTJCjDm4oGahPBV1py8Vpq6criv/AMzRfVYps0xEmFrMzoebj9JB63+TEbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761729043; c=relaxed/simple;
	bh=58jL2y/gEqi8IkGi6cwAeCP73Y4OQU0ztjpz4aNOSg4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uqx53zwdxayDtE5wNUZKeoNGFZvHyNBDaZQb6698KT0NJNeWE3CUGFMHVUZ9kJCx0/EjPGqWPKezHm7RmOEzEG0x/eBa5Co1LFFmK5ugNQVyziXNAiAiVtEgA8z8+cRcq+v+iF8kI/9LhIM83IQrIl5dw3AkRmOQhPsNxXKk4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmTqtfsn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCC5C4CEF7;
	Wed, 29 Oct 2025 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761729042;
	bh=58jL2y/gEqi8IkGi6cwAeCP73Y4OQU0ztjpz4aNOSg4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=bmTqtfsnDaoa3eJPBZnMW5KgvenGkuaMECW/i/j2+4WdByhxuZr0Fvu7dRaQ+UhgX
	 UL6ZGuIEzPwZYGh67NmvbPLslQprvqbW6p6lnt41b0E5R/UOyhyHnifmtavttJ4Kri
	 EqeAE/kTtoWk40rhnyfgp2cv+Vf9EHVVnK39cQEL5tp4kH29mdjXcJabxUy9t5YX8+
	 GX94pKSAJ8rUpodb3dDHIL4Pvk0yunZnvi+yQH4gFWI4YXTtXl3fa3fAO9dV3UOQtd
	 epKSx8F02uqDHtuolBCRKYWgqW1l1jkMEXSrwjEtr64Dl+IVmdDqiTI75oKyRu5Dnr
	 oC/E/tWT4lXfw==
Message-ID: <968fc56f-268f-4b2d-8f99-01fa886b524e@kernel.org>
Date: Wed, 29 Oct 2025 10:10:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils] v4l2-compliance: Fix test for UVC USER controls
To: Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20251028-uvc-fix-v1-1-dfcc504ff8e2@chromium.org>
Content-Language: en-US, nl
In-Reply-To: <20251028-uvc-fix-v1-1-dfcc504ff8e2@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2025 18:45, Ricardo Ribalda wrote:
> v4l2-compliance only supports priv_user_controls which id starts from
> CID_PRIV_BASE and are contiguous; or compound controls. This is not
> enough for UVC:
> 
> The UVC driver exposes two controls V4L2_CID_UVC_REGION_OF_INTEREST_RECT
> and V4L2_CID_UVC_REGION_OF_INTEREST_AUTO and reserve space for 62 more.
> 
> Make v4l2-compliance aware of them.
> 
> With this patch the following v4l2-compliance is fixed:
> 
> fail: v4l2-test-controls.cpp(326): expected 1 private controls, got 0
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  utils/v4l2-compliance/v4l2-test-controls.cpp | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index e4925ca3977b5b87a6a8e9ad5794847fa7009e50..6f645c4f9aca94a4ef586b11d6fd11268f1bf195 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -316,6 +316,22 @@ int testQueryExtControls(struct node *node)
>  		priv_user_controls++;
>  	}
>  
> +	for (id = V4L2_CID_USER_UVC_BASE; id < V4L2_CID_USER_UVC_BASE + 64; id++) {
> +		memset(&qctrl, 0xff, sizeof(qctrl));
> +		qctrl.id = id;
> +		ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
> +		if (ret && ret != EINVAL)
> +			return fail("invalid query_ext_ctrl return code (%d)\n", ret);
> +		if (ret)
> +			continue;
> +		if (qctrl.id != id)
> +			return fail("qctrl.id (%08x) != id (%08x)\n", qctrl.id, id);
> +		if (checkQCtrl(node, qctrl))
> +			return fail("invalid control %08x\n", qctrl.id);
> +		if (qctrl.type < V4L2_CTRL_COMPOUND_TYPES)
> +			priv_user_controls++;
> +	}
> +

Ah, no, this is wrong.

So a long, long time ago there were only standard integer type controls and driver
private controls. The latter started at V4L2_CID_PRIVATE_BASE.

The problem with that was that different drivers supported controls with the same
ID (V4L2_CID_PRIVATE_BASE + offset), but very different meaning.

When I created the control framework, I defined that drivers should use ranges of
controls IDs instead ensuring that control IDs would always be unique. Those are
reserved in v4l2-controls.h, in the case of UVC they start at V4L2_CID_USER_UVC_BASE.
And you can enumerate them using V4L2_CTRL_FLAG_NEXT_CTRL.

But to preserve backwards compatibility with existing applications that do not support
V4L2_CTRL_FLAG_NEXT_CTRL, the control framework maps those private ranges to
V4L2_CID_PRIVATE_BASE. See find_private_ref in drivers/media/v4l2-core/v4l2-ctrls-core.c.
This will just find the nth driver private user control that is not a compound control.

Drivers don't need to do anything, it's all done by the control framework.

In the case of UVC there is one such control: V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

So v4l2-compliance expects that when querying controls from V4L2_CID_PRIVATE_BASE
onwards, it will see one control with ID V4L2_CID_PRIVATE_BASE.

But it doesn't, since UVC doesn't support this backwards compatibility code.

There are two options: UVC can support this old way of working as well, or
v4l2-compliance skips this check for uvc. I'm inclined to just skip it for uvc.

This patch should do this:

[PATCH] v4l2-compliance: skip V4L2_CID_PRIVATE_BASE check for UVC

UVC doesn't support V4L2_CID_PRIVATE_BASE, so skip the check.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index e4925ca3..73a6a3be 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -321,6 +321,9 @@ int testQueryExtControls(struct node *node)
 	if (user_controls != user_controls_check)
 		return fail("expected %d user controls, got %d\n",
 			user_controls_check, user_controls);
+	/* UVC doesn't support V4L2_CID_PRIVATE_BASE */
+	if (is_uvcvideo)
+		priv_user_controls_check = 0;
 	if (priv_user_controls != priv_user_controls_check)
 		return fail("expected %d private controls, got %d\n",
 			priv_user_controls_check, priv_user_controls);


Regards,

	Hans

>  	if (priv_user_controls + user_controls && node->controls.empty())
>  		return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
>  	if (user_controls != user_controls_check)
> 
> ---
> base-commit: 796dc550a682e8f65fe6457cd5fec5ee123f39aa
> change-id: 20251028-uvc-fix-a8ce84e198f4
> 
> Best regards,


