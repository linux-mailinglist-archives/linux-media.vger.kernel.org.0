Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2AB33732D
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbhCKM5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:57:15 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38367 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233160AbhCKM5B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:57:01 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KKs5lP0Dw5C8yKKs8leVRb; Thu, 11 Mar 2021 13:57:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615467420; bh=ducZ1MWBdc08tOgzbGI/RLzKvcDo+oWgPtVNaBe5mvU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UkYx3gOFo8qGtu5pcJsAd555hjTrI77t83VHzbEFbH09/RHtrULR1SolaaFfUEYYP
         TUWt9zPtr6KYYdiLxCfFQGOBACW7q5JGV/PL1avG70xj/nu8D8JO7fnd2rWmJwWwZy
         gsBMZzy1uEvCbMmG2VglKaqDvIXw1LsukrJnkoWFFgnz3umZqBoiGu/n6afI56bTib
         DnaAGa2/uJWgM7kg7SdGcAAXQ8kPW+0U376LVfU8Em5/Q9Xxp38gAwt0cF9IVNK9WY
         jOS2uCU88hmJzlwzzyjxuWquBU3ybnbPhtf50f3jgnXG241u8rJOUuafq9Jps2GZ0V
         KJT1swKcpRXcA==
Subject: Re: [PATCH] v4l2-compliance: Fix V4L2_CTRL_WHICH_DEF_VAL in
 multi_classes
To:     Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
References: <20210310212450.1220416-1-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cbabd1db-5fda-309b-50bc-8398e8d1580c@xs4all.nl>
Date:   Thu, 11 Mar 2021 13:56:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310212450.1220416-1-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNLk/uLRfn2VXtPkms5atouh0rMbFctidNLI19SJVBPnTq2AnSgk8AehrvCyMRP5RWNhrNBbLU3PgVzhQw6XV5nsIAkRBEMJvfH8TlYWeEgWraE5OBBB
 KdpsH8tSPgzkZAJ//9+AcF/Ukrwid48VFepgsVFSUTMjV9xOqmYKClDX19edkuIHTIZmx32KYR98sLF25FuO216D+TT3zWJgFg0QgRQrgvLy6dIABwahns+l
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/03/2021 22:24, Ricardo Ribalda wrote:
> If there are multiple classes, the ioctl should fail.

It shouldn't matter if there are multiple classes or not, it should
work.

What is the exact error you get with which driver?

Regards,

	Hans

> 
> Fixes: 0884b19adada ("v4l2-compliance: add test for V4L2_CTRL_WHICH_DEF_VAL")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  utils/v4l2-compliance/v4l2-test-controls.cpp | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index 9a68b7e847b0..79982bc15054 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -793,7 +793,10 @@ int testExtendedControls(struct node *node)
>  	ctrls.which = V4L2_CTRL_WHICH_DEF_VAL;
>  	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
>  	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
> -	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> +	if (multiple_classes)
> +		fail_on_test(!doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> +	else
> +		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
>  	return 0;
>  }
>  
> 

