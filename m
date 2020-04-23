Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C42D1B573B
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgDWIaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:30:12 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:38719 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725854AbgDWIaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:30:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RXFHjKvGh7xncRXFKjPkxv; Thu, 23 Apr 2020 10:30:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587630610; bh=9WcQfpLGZN4pud2Zo3lEaTA3Onw7DFfH9kUQm9h+1zM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BwDjqcBYW+m+oVGZdJ+ip4h92AbIqPTE8rUc1tAN5jYETRneSq4K8J59In9Ta05PZ
         xC6tSWz9EdK5gZViTiq7oHQ4pyVA1SQn9aAAQ0C8Jhgrt3Oj5aZLqF3eUADFfkc8dM
         8wj6KETDkueJlC5zCUWvIcSWcyI58MhJ8WvrYr1mh0yKCu0VXfZralfJgLErGn+4QK
         CI+Lom138v9x+ivSgZ+A3K7kGj9BQ/APUEcJa7vl8XohYTTzjdIaLsvgVRqew4Q3iu
         HjxqWmVsoaZLgOxAd7I1d1ozNp+aSMrIWCDWUZmjhama02f4Z/RjPCVjoR/j7DxXtk
         RZR/L8J6FMJLA==
Subject: Re: [PATCH 04/12] utils: don't check unsigned for < 0.
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200422003735.3891-1-rosenp@gmail.com>
 <20200422003735.3891-4-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d1116917-29c6-fb16-f19e-e075c727bc94@xs4all.nl>
Date:   Thu, 23 Apr 2020 10:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422003735.3891-4-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDJ0wSjYCoBhAIAOfv00GDu8RjWP6uP5QEyf7pt6EP2XOQHX0sun+B0QJfYWQaIUHDSfi+8fnYsAkNnIB0IBIOz8q+FAgymkQfJAvpPjDfyAgIZznp3A
 ReKGOE83E6rabQ8c1aemZTBbeT8TgwAlLLcpn/pIM7dQigmvxJU0iuP50H/FcRCpO93wZYNqM4Z6c/RmsQoXkF64W+NL5hxcw2w=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 02:37, Rosen Penev wrote:
> Found with -Wtautological-unsigned-zero-compare
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/v4l2-compliance/v4l2-test-controls.cpp | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index 8c4480be..251a6049 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -80,8 +80,6 @@ static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
>  			return fail("min > max\n");
>  		if (qctrl.step == 0)
>  			return fail("step == 0\n");
> -		if (qctrl.step < 0)
> -			return fail("step < 0\n");

Ah, nice. This is actually a bug since this test needs to be done for
struct v4l2_queryctl (where step is signed) instead of struct v4l2_query_ext_ctrl
(where step is unsigned).

I've made a patch fixing this correctly.

Regards,

	Hans

>  		if (static_cast<unsigned>(qctrl.step) > static_cast<unsigned>(qctrl.maximum - qctrl.minimum) &&
>  		    qctrl.maximum != qctrl.minimum)
>  			return fail("step > max - min\n");
> 

