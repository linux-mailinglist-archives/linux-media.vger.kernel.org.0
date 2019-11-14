Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A016FCABC
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 17:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfKNQ2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 11:28:12 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:37990 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfKNQ2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 11:28:12 -0500
Received: by mail-qv1-f68.google.com with SMTP id q19so2576498qvs.5
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2019 08:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Wai+tSmKvkN0cOARIL7iY5strGB39aGj5Wh0+kf/GHA=;
        b=wN+SjksjTT8x89Jca7fttFx2CB4D2G2wZQOs7gsjJ1APLzCbUrQsFlHE0t3q3JoBsW
         mYu5IFI14BXv+CBbHfvvdTBS1EL1zzLEZpaK9++XOvUosa5ak/hwfpIv3Nmhl9xS32jB
         h7L+HPqSNlHOYRdfLB8QjedO/AKZwTfWPr8s94yJ6BqPDyin9QsJsYOfm+V/I0kq+YFa
         zd+q5Egj92brgvu44OFV8XoaX918vi1Ai8I6r3YaUps35XpR/pPXhKaywjkS6dG+RIzY
         2K4QS/qOvrQQBJL0e2rgZtEX5maKctpBG8xnByIrK94oFaGImpp8QtlPFSh2PcISk43k
         F2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Wai+tSmKvkN0cOARIL7iY5strGB39aGj5Wh0+kf/GHA=;
        b=XyL2PMq8JqMBSA/zjDNeO8lA05vU0ebNcI8rwmWDVIaNYKcKknePYLSUMxWZgGuwPM
         dT4qFTfrsf8duI93kgTaPZL9Ak0xA5Uf52X5A6SBFnLMrSf2Jm1dxsHTTsbRPA++BHGo
         8aVNfqj7LYaV8WZpuQ6evAo89iIJyLDLqFT46TPewIP+DdsBHx2r1y8ZgXkcgCT4ZnoT
         QIp10qLo4QUyBDo/t6xb+O0XDToKQ7hnmEmTsj79Qt8QgnCjhT1g1WPDhTy/8zJc+NiM
         RzPOBanuiJFfDjX59OLtuDQor3+PMtRomKT834sl8E51V9CG1UU2iHHCKKgAsZ/msDfD
         mv/Q==
X-Gm-Message-State: APjAAAXD1DnIrYmysMMtXzAXzaJIYp1MA4/4xptVe2ctOLDHwmBAWfD0
        eofavFDgId74q9lcuvgp/XNZ1A==
X-Google-Smtp-Source: APXvYqxNY1L4S2uJE1b5RoDY9vMhDMSdkS7oryFwnZKD8UNRS1TFAyI3dzPrT91ZS1fXahDXJ5yEAQ==
X-Received: by 2002:ad4:4466:: with SMTP id s6mr8805157qvt.57.1573748891250;
        Thu, 14 Nov 2019 08:28:11 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id r2sm3334674qtc.28.2019.11.14.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 08:28:10 -0800 (PST)
Message-ID: <c690a3c70b944261edb522316c541fbf0e7ba95c.camel@ndufresne.ca>
Subject: Re: [ANN] Report of Media Summit: V4L2 Future Work
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Ashton <mpa@fb.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Date:   Thu, 14 Nov 2019 11:28:09 -0500
In-Reply-To: <756c2d9c-ef4d-9f56-d6bd-a09767ec2ae8@xs4all.nl>
References: <756c2d9c-ef4d-9f56-d6bd-a09767ec2ae8@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le samedi 02 novembre 2019 à 15:06 +0100, Hans Verkuil a écrit :
> Action Items
> ------------
> 
> Nicolas Dufresne:
> 
> - provide more info about timecode use in userspace for Hans Verkuil
>   to verify if struct v4l2_timecode provides sufficient information.

Initial context we have:

   struct v4l2_timecode {
   	__u32	type; /* This is the FPS */
   	__u32	flags;
   	__u8	frames;
   	__u8	seconds;
   	__u8	minutes;
   	__u8	hours;
   	__u8	userbits[4];
   };

GStreamer on it's side exposes:

   struct _GstVideoTimeCode {
     GstVideoTimeCodeConfig config;

     guint hours;
     guint minutes;
     guint seconds;
     guint frames;
     guint field_count;
   };

   struct _GstVideoTimeCodeConfig {
     guint fps_n;
     guint fps_d;
     GstVideoTimeCodeFlags flags;
     GDateTime *latest_daily_jam;
   };
See https://gstreamer.freedesktop.org/documentation/video/gstvideotimecode.html?gi-language=c#GstVideoTimeCode

So the main difference is that GST allow arbitrary framerate, where
V4L2 uses a type for this purpose. I'm not sure how things like 29.97
is really handled in V4L2, is it exposed as 30fps and then handled with
drop frames ? That isn't very clear, but basically it is more of less
the same thing as Gst, and there is likely possible glue to make this
work.

In GStreamer, time code have been implemented when muxing into ISOMP4
format. For H264 and HEVC, they can be encoded into the bitstream and
extracted by the parser. We also have the ability to combine these
timecode with the close caption data. In therm of CAPTURE and OUTPUT,
we have support for decklink PCI card, which are SDI capture/output
card with currently proprietary drivers and userspace on Linux [1].

Real usage started around GStreamer 1.12 (so it's not that old) and was
needed for live television broadcast authoring software. The timecode
are (to the best of my knowledge) mostly used to synchronized the
streams together, as the streaming timestamp (e.g. RTP) might not
correlate with the moment the recording have happened.

It is also used when storing the live recording to disk, so that later
non-linear editor can align the tracks based on these timecode. There
is likely loads of other use case I'm not aware of, it's basically
information upon when this live recording have happened, could be few
seconds in the past, or years for recording.

regards,
Nicolas


[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/blob/master/sys/decklink/linux/DeckLinkAPI.h#L794


