Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A70C1163F8A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgBSIpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:45:24 -0500
Received: from mail-pf1-f178.google.com ([209.85.210.178]:35700 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbgBSIpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:45:24 -0500
Received: by mail-pf1-f178.google.com with SMTP id i19so876896pfa.2
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 00:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w7YXXPrjv0swolztGRRXXsVERSqdfE5ws09bwwHXbAM=;
        b=AkzCwOOM9iV/wba/KmNiKXDQYn8VyVEaoxrCMbBrWjk3TYIhMorbj0O4714xrL4Ldk
         OeV6RZvINWRxzG16nKHP8ARbTASTlGinofwrOq45IfH7HF/UqvYdk386zijReJ5dJ7BA
         leIYMPQtWfGrwkmW1HzYdISCOWppQNL+2uk2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w7YXXPrjv0swolztGRRXXsVERSqdfE5ws09bwwHXbAM=;
        b=jQ8Bg2G5kJ6wyNVJh3MgSGjApDSekrIJnUnfmAu2oy6KCpXZfWIxr+/cG7UiOlwsQR
         k4WkSduQtfmIfQc/ZF9Inoi2mXdl1tt01Dva6WDlxraMthjQsHIi/8V91A3gPlwaEqTO
         LW9VOyCZ/h39keoiVLPHCelTB8lZvRIARI/mJH/Ota+e296KAkVNI6ZyqK6tlXDPHomQ
         bbC1OX3azMAEuz47GKd7Zjx6QdRgcoOSpJqDZDdeKRC/0S3QwvaVlMWs3zBZHz5cZPfX
         CXnkty5VbawfKEEHhN5SIC0LYaUhb6VGRJB0wk6vyoAPwBDPbD7or1nbovp9stejBRmR
         IzEA==
X-Gm-Message-State: APjAAAXkjfGhs7M+SKJmuBfrzwbl2Odz9XtVqhhe56LGHIplulrlYK47
        Bw8xfpUlnnjOb/bSO+SnDDidcQ==
X-Google-Smtp-Source: APXvYqyV8+Z9aH1FsbTn2QqzC4e/hC2uwFNEmIHF7xi8WUMrQaRxZPRZs2r0DiSHvWuqXUZkiEF99w==
X-Received: by 2002:a63:2842:: with SMTP id o63mr27636968pgo.317.1582101923757;
        Wed, 19 Feb 2020 00:45:23 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id u11sm1646492pjn.2.2020.02.19.00.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 00:45:23 -0800 (PST)
Date:   Wed, 19 Feb 2020 17:45:21 +0900
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
Subject: Re: [RFC][PATCHv2 09/12] videobuf2: let user-space know if driver
 supports cache hints
Message-ID: <20200219084521.GD122464@google.com>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-10-senozhatsky@chromium.org>
 <2a00bf5c-462e-8d35-844c-55ce2383b8e2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a00bf5c-462e-8d35-844c-55ce2383b8e2@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/19 09:33), Hans Verkuil wrote:
> On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
> > Add V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS to fill_buf_caps(), which
> > is set when queue supports user-space cache management hints.
> 
> Ah, you add the capability here :-)
> 
> This should be moved forward in the series. Actually, I think this should
> be merged with the first patch of the series.

OK, can squash. This way I don't have to split 03/12.

I can also update V4L2_BUF_FLAG_NO_CACHE_INVALIDATE/CLEAN in 01/12 then.
Would that work?

	-ss
