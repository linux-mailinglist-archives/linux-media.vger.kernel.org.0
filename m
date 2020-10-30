Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 264A52A008B
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 09:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgJ3I6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 04:58:23 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48057 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725355AbgJ3I6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 04:58:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YQEhknGriWvjMYQEkkGjz9; Fri, 30 Oct 2020 09:58:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604048301; bh=hKR/eJ1yTmtG9y/mUnTDtJCLd3zgjl8xKTjdYZPCTAs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eCb1ZYxLLZLJ34eGFRId3ZfjI5NJMk2e1KCDbH+xTvhizWCdUpg5iYsXQ3Aa/nf2j
         3xv9sM8SQ8V309yB/y0xTIA1S3BJyiuub2+3gfnmDZKYH1SnPXn/a4oMYQ/3Ao/Rmf
         lGI/05JGfPx1uiLUtf9Afctxx/zgl0PUJOwDe+RFmXvY7qhbOJEEmQmPbPQJgYEyMX
         NfpZkJ+/3r3jL5r8jBKst0Tj99kyecqK4q8VN21rcVFgBmFKsmWKY2jHBY0dl8TWpP
         0PJFsada+59o65h4xFNRbwLR32jk6byhKiSUAM7GTfLiMNF2ZqgtXOmyiZJQV+ai+8
         1fq+M9T7AwgYw==
Subject: Re: [PATCH v2 1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED
 media bus format.
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201020154522.654-1-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <04d5a149-8745-ae20-a622-bcfcafb69cbb@xs4all.nl>
Date:   Fri, 30 Oct 2020 09:58:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201020154522.654-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFLMelhytvJkl5ojwxk1QbQO3rLfBBjidcrbZbb2AVnDunRh4ze4GWQIivmPxJVzV5GP6JvNryTaXXUZmZQQopDhahvFib0IGrCQs/jjwM6/GlrXGpSB
 BiUkWpS73pQ+FWlOXdjUl2t5H4NPg9vu2e8igxEuEXqnstcC0diHtIsrLVLGcpmjEhP9esU90mC1CrjoAaUcNKyeiRDCayuU9RNKVFDePTjOpQCRVcwWSB+h
 QUuVAMg4Fy5F0JHnHK513+P/NY3eRnQNaXvp1Xz3JiSpsKLGd6zqFf35e8TxIM/00enKd5Ua9AY8RfkdK7u9ULJqkA8ryb8G4NphbFyOehkxuL8YafUGlpPC
 t7NiVejOtZ9Id3D8I/khuVgezaaJtH1fkK9SIREfW3XZD0kr9xgJZ+LmPJ2GsxcIwf8SGwLIQLfH89sK9EYO7phO5jb3W2FgFIlwM9OQvapWoEoJnd7/WcDG
 wE6Hj/p0Jmzj1QW4lZ7dQLpcne8YPFRt8oMAAY+mMwn7f7X0dGiMqZhBTtBvku9SGN+qOow4sbmRBfsPXKwys+AcE8ZHEL3+WLLKfQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/10/2020 17:45, Dafna Hirschfeld wrote:
> MEDIA_BUS_FMT_METADATA_FIXED should be used when
> the same driver handles both sides of the link and
> the bus format is a fixed metadata format that is
> not configurable from userspace.
> The width and height will be set to 0 for this format.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
> changes since v1:
> 1. replace "This format may have 0 height and width."
> with "Width and height will be set to 0 for this format."
> and add it also to the commit log
> 2. s/meida:/media:/ in the patch subject line
> 
>  include/uapi/linux/media-bus-format.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 84fa53ffb13f..2ce3d891d344 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -156,4 +156,12 @@
>  /* HSV - next is	0x6002 */
>  #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
>  
> +/*
> + * This format should be used when the same driver handles
> + * both sides of the link and the bus format is a fixed
> + * metadata format that is not configurable from userspace.
> + * Width and height will be set to 0 for this format.
> + */
> +#define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> 

Documentation/userspace-api/media/v4l/subdev-formats.rst also needs to
be updated.

Regards,

	Hans
