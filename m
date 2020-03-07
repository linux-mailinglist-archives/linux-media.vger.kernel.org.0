Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 151B117CD4A
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 10:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgCGJiE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 04:38:04 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38038 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgCGJiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 04:38:03 -0500
Received: by mail-pl1-f193.google.com with SMTP id w3so1904415plz.5
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2020 01:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xgm+vlDt9tYOqUwFznd38xlWEF7FNzt6k+k3ObuJ1kY=;
        b=DgAHZ+jhVSQxjb/Z2xyuvTHfOSirzcsHebExJpG6TJQ+d8rBPmsZ18XUaspC1WjvJS
         6IxsVXk5OyTckehNRnPot+D9e+S3Kvn48H7XghgA3E+hgbQv/1xQcpfnh2pQW6q8KEyN
         RzxbcG0DvS31h/hQ/0C+29mwPRVBmkiACA1QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xgm+vlDt9tYOqUwFznd38xlWEF7FNzt6k+k3ObuJ1kY=;
        b=rQy9bGFoVBDXa9VKbLImxl9w/h2NxCEvWdiwJJn+23c3oCQUE0QSn+BlUyFTVP0L0v
         30zQI+nnuV3VQEYSE/PWqEucJd23yvOwYxIcbMNZoD/A/mHGlF15/4UpsH1po5D1oUpw
         aquk6lWr7dNmConc8mFfa1cUHybtMkRmKe2HO28MKHwhhPWFKgh3SGeWwYWQMZ2gd2xL
         tgs4UkI10w1y3HJKKuscjeApahjYjAfkyHgeTKV0/t0HWyre2OrTYqsV0mhp1JlszRCi
         nkwd5G8x8cFfh7A6Lul8d6n4RssSXxsD0qY38t1chzGV21vU8EtTZlQNnh073vHvIApA
         +dbg==
X-Gm-Message-State: ANhLgQ1AGnxl1K2ybFPWuDF/wBguzpMRq/9Vso6KHX4YoUbqNirJoGnx
        XuNdpFqB9Cxs5hnRmOsgVluH0A==
X-Google-Smtp-Source: ADFU+vvwb0DDLHcnVLokBUhb8ulXe7fYoKuQfgjLRmo8/MSYTNbBubhgnZ+ppY9NwYkh1sxCNWNtOg==
X-Received: by 2002:a17:90a:3ab0:: with SMTP id b45mr8260362pjc.9.1583573882596;
        Sat, 07 Mar 2020 01:38:02 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id x19sm15089504pfc.144.2020.03.07.01.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 01:38:01 -0800 (PST)
Date:   Sat, 7 Mar 2020 18:38:00 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv4 05/11] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Message-ID: <20200307093800.GA191261@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-6-senozhatsky@chromium.org>
 <70144162-3bbe-4ea5-a3f7-e52d4585db53@xs4all.nl>
 <20200307075127.GD176460@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200307075127.GD176460@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/07 16:51), Sergey Senozhatsky wrote:
> On (20/03/06 16:30), Hans Verkuil wrote:
> [..]
> > >  
> > >  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> > > @@ -2446,7 +2449,8 @@ struct v4l2_create_buffers {
> > >  	__u32			memory;
> > >  	struct v4l2_format	format;
> > >  	__u32			capabilities;
> > > -	__u32			reserved[7];
> > > +	__u32			flags;
> > 
> > The new flags argument needs to be documented in the command for struct v4l2_create_buffers.
> > 

Hans, what does "command for struct v4l2_create_buffers" mean?

BTW, I added v4l2_create_buffers::flags comment:

---

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 12b1bd220347..c6c1cccbb5c1 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2441,6 +2441,8 @@ struct v4l2_dbg_chip_info {
  * @memory:	enum v4l2_memory; buffer memory type
  * @format:	frame format, for which buffers are requested
  * @capabilities: capabilities of this buffer type.
+ * @flags:	additional buffer management attributes (ignored if queue
+ *		does not have V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS capability).
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers {
