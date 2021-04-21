Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EAC3666B7
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 10:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbhDUIHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 04:07:24 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46273 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230516AbhDUIHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 04:07:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Z7sil8rxFXsivZ7smltu8l; Wed, 21 Apr 2021 10:06:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618992408; bh=9++E6vHlXgz8kXpztmsZ5L0A7tr+JT8LzpFXbP+4taE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AU0RtGn73JEtbs3hOo9TvhGfUHeZMmqSaga2gICHsL159iitfZPxb277S58R9owg5
         lZnMC2PiLEawWMCVBjAfZwuR6GedK6rHs82PX6bGGnB5mpFGi3irFMPbiISigdYm8/
         cn/JTbb5mTNTxkh6t6YUq/huOUIPjboo+WL6g3+wwbnnZA9h6rh1NzhP3ZtwxDpExq
         auRL0dV3hu01jZet9Nw8vZKvcNQngOeW5oHZyVU06T2EfFiinjXbZahiaii/j7uAuE
         YyIP/KAZ1Dj6W3ZITc8ZBhHCCmJzvSVsEQnNafZX3EaGUtmA741U/SHN0u5/Ro9ySy
         h1krK/41qwhkQ==
Subject: Re: [PATCH 8/8] v4l2-utils: turn prefixes to a constexpr array
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20210421072035.4188497-1-rosenp@gmail.com>
 <20210421072035.4188497-8-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <566ba9fe-509c-26b4-19a3-845a45093ba1@xs4all.nl>
Date:   Wed, 21 Apr 2021 10:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210421072035.4188497-8-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCkfbxLLMqKTb9w1+67LXSDMfEQyrLLzEtLmTbj7gJYPAsAdcbNp+nFmT43nGnDUz7ldYq81iSHD21qYHoCs5Vx1fJek6uTrk8QL1OsRetCiiMDGwH/h
 0tiR7fAykKZ3TVH4HVVI8XcuXRJJXtT5FSGUUKTlCfM/sEbC47NnZoZ31PeB12tdFNAcHNJmNz5LrTJRZ+6IYDszDihGoFD/lGFcMAIM8qIVD9WuWvnhM1ot
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2021 09:20, Rosen Penev wrote:
> Allows usage of a single any_of instead of a raw loop.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index 17ad488dd..2b6dd6d13 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -116,28 +116,14 @@ void common_usage()
>  	       );
>  }
>  
> -static const char *prefixes[] = {
> -	"video",
> -	"radio",
> -	"vbi",
> -	"swradio",
> -	"v4l-subdev",
> -	"v4l-touch",
> -	"media",
> -	nullptr
> +static constexpr std::array<const char *, 7> prefixes{
> +	"video", "radio", "vbi", "swradio", "v4l-subdev", "v4l-touch", "media",
>  };
>  
>  static bool is_v4l_dev(const char *name)
>  {
> -	for (unsigned i = 0; prefixes[i]; i++) {
> -		unsigned l = strlen(prefixes[i]);
> -
> -		if (!memcmp(name, prefixes[i], l)) {
> -			if (isdigit(name[l]))
> -				return true;
> -		}
> -	}
> -	return false;
> +	return std::any_of(prefixes.begin(), prefixes.end(),
> +			   [=](const char *prefix) { return !strcmp(name, prefix) && isdigit(name[strlen(prefix)]); });

Yuck. Besides, it is wrong AFAIKS since strcmp is not the same as memcmp.

I like the original code, easier to understand than the replacement. So sue me :-)

Regards,

	Hans

>  }
>  
>  static int calc_node_val(const char *s)
> @@ -146,7 +132,7 @@ static int calc_node_val(const char *s)
>  
>  	s = std::strrchr(s, '/') + 1;
>  
> -	for (unsigned i = 0; prefixes[i]; i++) {
> +	for (size_t i = 0; i < prefixes.size(); i++) {
>  		unsigned l = strlen(prefixes[i]);
>  
>  		if (!memcmp(s, prefixes[i], l)) {
> 

