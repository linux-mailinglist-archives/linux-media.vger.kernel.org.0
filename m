Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E232517D85E
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 05:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgCIEDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 00:03:08 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:45666 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgCIEDI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 00:03:08 -0400
Received: by mail-pl1-f179.google.com with SMTP id b22so3418541pls.12
        for <linux-media@vger.kernel.org>; Sun, 08 Mar 2020 21:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MePM1LXmB9zu10CipKCKT3AOCH0ORjlABBFj6iXCvwo=;
        b=g98VXD5fWvExJ1O1zTNwK2U30AXvWKVY+rszXkxQb4p4RypmzbUbGoKjultjn8YWKf
         Cc3+YRCE/xZo+6pNSg6+mUgMRDvTBTafPeUbeaTFY8+iPw7E2FSjUlKTW0xmBEcG81ci
         KmijLJmDOXv2p0lOtqJIWLKmTWgITI9OSPx5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MePM1LXmB9zu10CipKCKT3AOCH0ORjlABBFj6iXCvwo=;
        b=r0ChHuyRy6uk0hKlEmQlHRMNLtyEqBZICP/IW3YE4wF/k3KJh0ThR1heShksH6zSTX
         enBPhZtYkzGnZTkTnpp0RMmvp7yOcLSqu3DqldBTUt7+R6p9Wg2HPZkyoI1DxHUFyd1U
         W0ybuQQK1l7p/ohKkVR0efFXnwUpSugkUfmV6g7T4vVhX6o4pZBb4pB034JAWlIyhS/X
         6ratf2B5fY1FmKGrPUB8GhxJtCx6fW4w5TVMbuA01RV9xHY1wwdaz8+JsAgo6uNafDKc
         3oOGpLyzGUT6HbQwLbBCgNK4tyqKqWFoRbF1uBOfs+9CdGs3nHHMne1dxDFdytH7rnJB
         MXow==
X-Gm-Message-State: ANhLgQ1ZicsC0TeL28P4mfyDyymNu2+Ikp8A0zOlLjlTuSmV2IE1WIb2
        cTA4unUBwg2oay1JQtT2ZkVssA==
X-Google-Smtp-Source: ADFU+vtw1v/LUtTzhPiRwFAG99XIoB6s3/fRb+QC53epenxq92s4BOkmVBFa4hEM9XaA1/1M7jNzkg==
X-Received: by 2002:a17:90a:8586:: with SMTP id m6mr16360811pjn.121.1583726587196;
        Sun, 08 Mar 2020 21:03:07 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id l13sm16686316pjq.23.2020.03.08.21.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 21:03:06 -0700 (PDT)
Date:   Mon, 9 Mar 2020 13:03:05 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
Message-ID: <20200309040305.GB9460@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/07 12:47), Hans Verkuil wrote:
> 
> 1) attempting to use V4L2_FLAG_MEMORY_NON_CONSISTENT will clear the flag
>    upon return (test with both reqbufs and create_bufs).
> 2) attempting to use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
>
[..]
>
> All these tests can be done in testReqBufs().

MEMORY_NON_CONSISTENT is a queue property, we set it during queue setup.
NO_CACHE_INVALIDATE/FLAG_NO_CACHE_CLEAN is a buffer property, we set it
when we qbuf. I'm not sure if all of these can be done in testReqBufts().

	-ss
