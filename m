Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18BD5120982
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 16:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfLPPVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 10:21:30 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:44922 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbfLPPVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 10:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=S09ne7xBB+FzyhRmEbi4DpLN8RlKiZzIskLABcuaT+s=; b=uyOLa8pxzeg2dVT8lMYQSFa/I
        HMKsTh03xyf5K0fXjiX7B08/wLq7EVeEcQ9ulFK4pBBBAp7P/x5OasvBSR+GjsxNHQIJdru6JQBtt
        Y7yJyCXwpfQRAijoR0V7iRCq3l80nLBN1dtsjjN5bnjeZeY9NAPq5FJFcbsWy54uXYxmWWOhMyZOL
        LmW59RCKg6JOamGcfFfwhHbLRIQMiB8uzABIZP9VD4947qMJOjUgB+bmtQW6Rowd576rZAUfTkYNZ
        /pgHvXSrBwGlp/uGlQus9zDbu4w+gN48PK48mD1Ttr6qzGtZ5s5umfg4SucR5UNXfGRY8ys1KJA/w
        J4x3CYOAw==;
Received: from tmo-101-54.customers.d1-online.com ([80.187.101.54] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1igsBa-0005pp-HP; Mon, 16 Dec 2019 15:21:26 +0000
Date:   Mon, 16 Dec 2019 16:21:22 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Sean Young <sean@mess.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        y2038@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/8] media: documentation: fix video_event
 description
Message-ID: <20191216162040.6aba340b@kernel.org>
In-Reply-To: <20191216141506.121728-2-arnd@arndb.de>
References: <20191216141506.121728-1-arnd@arndb.de>
        <20191216141506.121728-2-arnd@arndb.de>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 16 Dec 2019 15:14:59 +0100
Arnd Bergmann <arnd@arndb.de> escreveu:

> The type for the timestamp in video_event was changed to
> 'long' a long time ago, change the documentation to match.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This patch seems fine for me. Even if the other patches need a v7,
let's apply this one and remove it from any future re-spin of this
(if ever needed).

> ---
>  Documentation/media/uapi/dvb/video-get-event.rst | 2 +-
>  Documentation/media/uapi/dvb/video_types.rst     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/media/uapi/dvb/video-get-event.rst b/Documentation/media/uapi/dvb/video-get-event.rst
> index def6c40db601..7f03fbe3d3b0 100644
> --- a/Documentation/media/uapi/dvb/video-get-event.rst
> +++ b/Documentation/media/uapi/dvb/video-get-event.rst
> @@ -81,7 +81,7 @@ for this ioctl call.
>  	#define VIDEO_EVENT_FRAME_RATE_CHANGED	2
>  	#define VIDEO_EVENT_DECODER_STOPPED 	3
>  	#define VIDEO_EVENT_VSYNC 		4
> -		__kernel_time_t timestamp;
> +		long timestamp;
>  		union {
>  			video_size_t size;
>  			unsigned int frame_rate;	/* in frames per 1000sec */
> diff --git a/Documentation/media/uapi/dvb/video_types.rst b/Documentation/media/uapi/dvb/video_types.rst
> index 479942ce6fb8..2697400ccf62 100644
> --- a/Documentation/media/uapi/dvb/video_types.rst
> +++ b/Documentation/media/uapi/dvb/video_types.rst
> @@ -170,7 +170,7 @@ VIDEO_GET_EVENT call.
>      #define VIDEO_EVENT_FRAME_RATE_CHANGED  2
>      #define VIDEO_EVENT_DECODER_STOPPED     3
>      #define VIDEO_EVENT_VSYNC       4
> -	__kernel_time_t timestamp;
> +	long timestamp;
>  	union {
>  	    video_size_t size;
>  	    unsigned int frame_rate;    /* in frames per 1000sec */




Cheers,
Mauro
