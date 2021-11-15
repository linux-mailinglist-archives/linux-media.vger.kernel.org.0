Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18146450742
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236744AbhKOOmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236285AbhKOOmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:42:09 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D627C061746
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 06:39:12 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id md8WmFddbfwDFmd8ZmOoHb; Mon, 15 Nov 2021 15:39:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636987151; bh=ZynsvlZ4uT5VZiWyOPdGIhozkYTCEWEKjdbD/XJndw8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=io8CVL94TSG+JbTue8IYBIuOdMHjcAA6413PlGTo99744txXkydkLqk41rVZZ5YQV
         4Y2A2EgzWv6PCvhHTGrVbM6yNBGySjwJThrDh7rGu3Lebv71LH+YmF2nT9rIyLxEqh
         BucvvJWwR4Oz+PL968cqg0pmSvpR2L7M+/aczJ0YznOPOzRwhGi26O9YRthAJXCZ/9
         aCOpqz6Y0Ou7YGGcGB1JKM7puriodf/i4LFjnK+4Sv9X4RoXLIck9A0xNQdUvNYUq+
         xRg0c7ysqA++bKVIzLKGw+uJyxhvDdQP8MCY/bacvIi5bT97OG6lp0ifDylHqZxrrH
         uZ7Kgv3jIE/5A==
Subject: Re: [PATCH] V4L2_PIX_FMT_GREYSCALE for coda960 JPEG Encoder
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Weber <martin.weber@br-automation.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <VI1PR0602MB35495D33CD3DD897F0A41D5ED3929@VI1PR0602MB3549.eurprd06.prod.outlook.com>
 <d125181203cd03cfb01eb5b4d86770b74d8d7b77.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <53088d51-1a45-03b5-8186-33a8ab0aa158@xs4all.nl>
Date:   Mon, 15 Nov 2021 15:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d125181203cd03cfb01eb5b4d86770b74d8d7b77.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH3i4I3tHPCBryALLwn33r9jZr0jasduYAPllVrQ1cI/T+bajigHcRPP3jZemDOVdIslnCyvlnNj/RuUo2oiOc0N2f8DMagOnRtnJYxWxJ2d7SX66mSH
 gAr7A/e8yR38ySlG54NvZ4BVoV/Kt4UeW66xXVbfSQkJq8zlrSyjyfqIez3FnwPKea2voYrU324lyNw7ZWNoZRbfAcBvgC7AeO6+F3GWyxdAahxefCPNrYYh
 wFZ+fk/fJn9LvMCwil6sbeyQqplmaRYMwxkInzgJQfZjrcQDTVzWw2bibajkilEo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

No need for a v2, I've fixed up the subject line and will merge it.

Just remember it for the next time you post a patch :-)

Regards,

	Hans

On 11/11/2021 17:17, Philipp Zabel wrote:
> Hi Martin,
> 
> On Tue, 2021-11-09 at 11:43 +0000, Martin Weber wrote:
>> support greyscale pix fmt input for coda9_jpeg_encoder. The hardware
>> supports it, so allow V4L2 Mem2Mem JPEG Encoder use it as well. Tested
>> on an i.MX6QP.
>>
>> Signed-off-by: Martin S. Weber <martin.weber@br-automation.com>
> 
> thank you for the patch! I never tested grayscale encoding, so I didn't
> expect it to work out of the box :)
> 
> The code is fine, just a small formal issue: the subject should be in
> the style used in the media subsystem. For example:
> 
>   media: coda: V4L2_PIX_FMT_GREY for coda960 JPEG encoder
> 
> (note that there is no V4L2_PIX_FMT_GREYSCALE). Please resend a v2 with
> the subject fixed and feel free to add:
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp
> 

