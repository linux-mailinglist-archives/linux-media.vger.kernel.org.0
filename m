Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4971B30357D
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 06:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731843AbhAZFnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:43:47 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46709 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726110AbhAYJRr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 04:17:47 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3xgdlSZ5liWRg3xgglfVNP; Mon, 25 Jan 2021 09:57:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611565053; bh=Cg0C444tQm28uUmnFYRWQssZ7i1ibjFWyLPPzyy9tOA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PxLoKjfLxlVxiT7amVhnTQKWwqMpx9kilhrqSZVbbHK3SQGJ04xBpuxt9wM31dbbT
         qw4BK+hM8CqK6wuss0lp2HtwC4gBxgfG6pIEl0K90PzKFh6GzyVe0XywMPg0A1BpiX
         EIwivR1qrDQWlbtK22Z+bZKA/JPcjXLyOqNUpOnvLCxu56I3pbGY2VSAIyNxXms2H6
         BRWvLa2u1JCoA0xArBr+Ub8FJTeLtv6q+Yg8W4DNucHLXg14gS/iu1t76LY4RYkmdw
         q3my25p2eoQSnbhGpgliE9O85ydruyFWtE53kJ201ygwopG6RdK8ENDZuXQ+QtSxGg
         BY6wmooO1TrVg==
Subject: Re: [PATCH 0/4] media: vidtv: add media controller support
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <46584ea9-81ff-a3a6-2853-fade654bd2fd@xs4all.nl>
Date:   Mon, 25 Jan 2021 09:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIrhUs8azoJXXgV3bGWciye9in8e1NG+Is9X14KzRn8mqJAM1/A5uzLnjfC5Y/iuHO6g5KJ4/WEMnR5m+f2xXKSKJ9m2jYwquUbPDKKnptPljMxO+8EV
 xTzVFVE56QqHzLRIgif0r8Gf1qGx3nSCmtg9VVQjMSLkx0x/rlW+MCKp3dw/YnvwERlRJNR70B8/WWnI5NkfIT7O/PGmrhXA1JyLX8hOJlY8VToYqrx6+H4J
 3Ki74U2LcWqaECUOU2hUgTQIggLenAYCS/W1LmLYgLnjltqIld1RBnR+SA2uQu4cGfr8CB+EYZkcbT1ieT+et1IhgXeEwRo2zMwyAjMdt7oJ2sg/mmRB1sJJ
 kguX04RnlUZA4GWMyfRO+C86e+vcGg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/01/2021 14:09, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This series adds media controller support for vidtv so that we can
> support this driver at the test-media script in v4l-utils.
> 
> I based my implementation on vim2m's.
> 
> Daniel W. S. Almeida (4):
>   media: vidtv: Add media controller support
>   media: vidtv: reinstate sysfs bind attrs
>   media: vidtv: use a simpler name in platform_{device|driver}
>   media: vidtv: print message when driver is removed
> 
>  .../media/test-drivers/vidtv/vidtv_bridge.c   | 32 +++++++++++++++++--
>  .../media/test-drivers/vidtv/vidtv_bridge.h   |  7 ++++
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 

For this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Mauro, it would be very nice to merge this. It will make it possible
to add vidtv to the test-media script for regression testing.

Regards,

	Hans
