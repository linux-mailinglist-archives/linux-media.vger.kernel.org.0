Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8361C24BB4D
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 14:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgHTM0p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 08:26:45 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58983 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729896AbgHTM0k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:26:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8jePkHJ4bywL58jeQkZbaP; Thu, 20 Aug 2020 14:26:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597926398; bh=CEj6MFOXGvaZtLlvzBU64am2B9bN/pNTuUh0g8wbVQc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HrAM5EHjVk2CTNp5Ut7Bnig4ORBYfo4YPK8Xg6TJQ9k5Bg8UpPOocsbW18U7Zqzu6
         7Y3UQPMqfY1kCbDCBVHKUaVE1oKFEV0ElhpfkEjkqguN0JLeYJGoir+PBUrmbZQPxB
         FDmWsNu4EfYqcLDep4q/6XJKZRRwL3NcUXNsKLXX/GPTdFlp9AEj8cdTbs3w0SiWC3
         osPESMrMmzWEuJAg4TrhL4uYDmGVne/ErlSD2cIoTk2Jv3lMcMGQCEQkV+7syaI4gL
         b44t4IBQZFbx1rTTFqC24d7AQqCdub+i+/wMj9UujwX2L9N/L0v5cDeNqzWmCZE8D8
         QgwJl96uLfJfQ==
Subject: Re: [PATCHv2] fix GCC enum warning
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200803213929.34616-1-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <992328dc-8ad5-063c-69fc-b01364bf3011@xs4all.nl>
Date:   Thu, 20 Aug 2020 14:26:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803213929.34616-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIfGEgnIZw2bU/2LT7sJJZr2omNUBETtULbIlwKuaCZYjPqXD16D/S7gOWYv0oY6tx7ZUUjQAyhqer2ALXz4i0wMM3+wCecGDHdooAZKQR04hiJ2skK8
 O0yuvw20Y41i4XIH8TNWsI9mjYtKtpIiGJH+wy13PlK1mbhe5EsJlBuw3CBUaylf6ROsfq5kN7VclfdDkowG/7pI6gWHxGsKsoP4W4CChQYnS+zTvn5xG8+e
 buob9WTLqE0x7squiJX+ydxVFsNrvyTk2BJjtwxVQCqaX5khQYtjR5rL9POToUYBn+tbmvDYUrOiWFklmIqIGQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/08/2020 23:39, Rosen Penev wrote:
> Found with -Wenum-compare
> 
> ../utils/common/v4l-helpers.h:880:36: warning: enumerated and
> non-enumerated type in conditional expression [-Wextra]
>   880 |  return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: Added warning message.
>  utils/common/v4l-helpers.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> index e093e717..edd21c16 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -877,7 +877,7 @@ v4l_format_g_hsv_enc(const struct v4l2_format *fmt)
>  {
>  	unsigned hsv_enc = v4l_format_g_ycbcr_enc(fmt);

Does the warning go away if you replace 'unsigned' with enum v4l2_hsv_encoding?

I would like that a lot better than casting V4L2_HSV_ENC_180.

Regards,

	Hans

>  
> -	return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
> +	return hsv_enc < V4L2_HSV_ENC_180 ? unsigned(V4L2_HSV_ENC_180) : hsv_enc;
>  }
>  
>  static inline void v4l_format_s_quantization(struct v4l2_format *fmt,
> 

