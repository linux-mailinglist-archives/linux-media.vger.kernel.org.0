Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B94717CCBC
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 08:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgCGHva (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 02:51:30 -0500
Received: from mail-pj1-f46.google.com ([209.85.216.46]:35640 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgCGHva (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 02:51:30 -0500
Received: by mail-pj1-f46.google.com with SMTP id s8so2107688pjq.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2020 23:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=72BokNb8+LRSUqSnxvdTJFvIWXTSEo6fEq3Gaxcb910=;
        b=BEpDNdyx71F/hSRDAJAun6HAJilAUYxlfls/m7UjSN+TFYEJloIyFSIHdSNYTVxKzz
         AjL3TQgsUdoqf4BQbAFPLf74QCsFrFrJB1W3Lqozw9LFMzUECsdwO50nVyPTeDOfEqbe
         /IWuGWiTYZ55XuxZ8j8OjLstHN+tEemVjYnAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=72BokNb8+LRSUqSnxvdTJFvIWXTSEo6fEq3Gaxcb910=;
        b=ouc/CPJJTAlkfOYqI36ZUZnlYiAo5xtoUuZ8XlbOdDP9zw6un/t3zLvGMe+CGhT19I
         h7h5kW+S+Iqs8/5o+S5FgXm4tp7xdvzb2+WfvJMhMjC0idsosDBwe3d1ZuUaDB4Py1sB
         sQTPXLub6BOeBV1ZM4V+f6qVnjYZ71fBdETRIMW3Fu4dNx/Mo50e3lON27dAQ1dJlcHY
         BqKrTtolaaMTIgOI+PJglGnzNpftl8izqi7OPrPZdPHpALrHky+V6YWqF+CGtOgMSviX
         sr+LocZQYJGhNfiNkRS8ZbaVlvVQj7ESU7IUJff+pr97d/LBlW8iUR0bMkmH8f+iTKhj
         k9hg==
X-Gm-Message-State: ANhLgQ1hBMM9Hq2I+mSlLh4DhdHnbqKtxZQqcYxfn2tJhQ8jpO8OfS49
        fwTYOEwz0HmTDWEQ3Gj6izy99Q==
X-Google-Smtp-Source: ADFU+vtTXPsliF19xRSptfi9Zpe5YBygsbKqgsfbJRHtpar7l8SNDU/a8t6xhuVE0ZHysXHaCVrXAg==
X-Received: by 2002:a17:90a:858c:: with SMTP id m12mr7480297pjn.127.1583567489536;
        Fri, 06 Mar 2020 23:51:29 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id h2sm7621630pjc.7.2020.03.06.23.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 23:51:28 -0800 (PST)
Date:   Sat, 7 Mar 2020 16:51:27 +0900
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
Subject: Re: [PATCHv4 05/11] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Message-ID: <20200307075127.GD176460@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-6-senozhatsky@chromium.org>
 <70144162-3bbe-4ea5-a3f7-e52d4585db53@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70144162-3bbe-4ea5-a3f7-e52d4585db53@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/06 16:30), Hans Verkuil wrote:
[..]
> >  
> >  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> > @@ -2446,7 +2449,8 @@ struct v4l2_create_buffers {
> >  	__u32			memory;
> >  	struct v4l2_format	format;
> >  	__u32			capabilities;
> > -	__u32			reserved[7];
> > +	__u32			flags;
> 
> The new flags argument needs to be documented in the command for struct v4l2_create_buffers.
> 

Will add.

	-ss
