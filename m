Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1EF17DC20
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 10:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgCIJIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 05:08:06 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:55157 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgCIJIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 05:08:06 -0400
Received: by mail-pj1-f44.google.com with SMTP id np16so4088163pjb.4
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Zn5cohc9+dV+bc+jr0Y3IxVaSp3atkPAhci1ZiQCOiE=;
        b=lb76EOjrQJ2kmq2xRlbXLyDCaHjzcbZRLgkdY5Gnb4qTOS++wMphzDSsoXFT5w+EFT
         Uz+HZ10OCpASqR6vDFKkpvPRUsfD3TaSSpkbl2KX/Sbifvg9Yrfc4uP6qqexi8OB8obE
         FArxbS5v3MTQCSAO6tQIHpfrO3Hicd4Kw4FoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zn5cohc9+dV+bc+jr0Y3IxVaSp3atkPAhci1ZiQCOiE=;
        b=cuPqhBhqIDawijQvj9iodBBcikpTHVk05UGRtu5Q+T91ks8/Ox4FWWJK23kRf/lMJI
         E7J5y0+achep3B1zP3X2sByWLohWgr/lpKfFYg1fX5O/1YPDpjluOrIg9Qb1qRwwiNff
         ucmR4NpVpvI3KZpW6D7s3ElelIvFqw1t1Tk6SPH8MExKqm78gbJ4rAABQl7wmB5DE+92
         75aSZVnrnykGkmG1CWKVCt+7cyUcLMtQpnDmw9+0g+QH/zHvVGBlSrC9JEgsf9ly3Evh
         LUsx3CzJXojZBEnIUZJBmdlAzbuHHRN6HCi8TNg6ZNZoO67+KMwWhXunziWQ3bFpSyly
         yxuQ==
X-Gm-Message-State: ANhLgQ1uDWoTXy7NaZJOVssjJdmXE8v22Gr+0LWo7+rVzOutIZsVAuqy
        z4ZNqZiNR/Q4QNWn9Qt1PS+8/Q==
X-Google-Smtp-Source: ADFU+vv0zF7N2cmYA5X/gp1rv27g/hBfgjCfbp21zaZtDnFG9hJlIvEUCyJpYWMqejwNtOCrkdPgwA==
X-Received: by 2002:a17:90a:5d88:: with SMTP id t8mr17937901pji.120.1583744885055;
        Mon, 09 Mar 2020 02:08:05 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e3sm12252590pgm.15.2020.03.09.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 02:08:04 -0700 (PDT)
Date:   Mon, 9 Mar 2020 18:08:02 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
Message-ID: <20200309090802.GA231920@google.com>
References: <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
 <20200309032707.GA9460@google.com>
 <40cd09d9-49a6-2159-3c50-825732151221@xs4all.nl>
 <20200309072526.GC46830@google.com>
 <e31197b6-5d22-0c3a-cc77-e9506136ada5@xs4all.nl>
 <CAAFQd5Ajopb019HZmtNJfDZmZbssDHfztmT0BvAD07QttXmZ1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Ajopb019HZmtNJfDZmZbssDHfztmT0BvAD07QttXmZ1g@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/09 17:58), Tomasz Figa wrote:
[..]
> > > I see. Hmm, how do I do "test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS
> > > is never set" then?
> >
> > Not sure I understand your question. When requesting buffers for non-MMAP memory,
> > this capability must never be returned. That has nothing to do with a cache_hints
> > module option.
>
> Have we decided that we explicitly don't want to support this for
> USERPTR memory, even though technically possible and without much
> extra code needed?

My irrelevant 5 cents (sorry), I'd probably prefer to land MMAP
first + test drivers patches + v4l-util patches. The effort
required to land this is getting bigger.

	-ss
