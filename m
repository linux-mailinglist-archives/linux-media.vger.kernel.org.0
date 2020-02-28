Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E28172E50
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 02:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbgB1BZU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 20:25:20 -0500
Received: from mail-pj1-f53.google.com ([209.85.216.53]:37630 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbgB1BZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 20:25:19 -0500
Received: by mail-pj1-f53.google.com with SMTP id m13so562887pjb.2
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2020 17:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=58TaW2PPYK05khBxPe9LT47jiedjBGNDrtGrrUs1u3Q=;
        b=Ncbm2mMT+BUZspKp+izFI9pTKdcn/wuxNopxCdc+FNMBTN28s9HrD6HQkijmPK/4uf
         Cpt/X9JYHVue0jt5JHSN1kUxmlZvxvd3LKw3c6CHRcGEEw6UEoo4lWz0WPl1PQ++GTEu
         0DFl1e2Q0A8H4NSkKyNQPnL1u9SCipXFU/ALw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=58TaW2PPYK05khBxPe9LT47jiedjBGNDrtGrrUs1u3Q=;
        b=DN9/jW/sMqg3lMXgqYXkokItw3hsWgi94bJXwWLaPG6sEcqhfB/aX7mss3zL8mW1Kx
         k6UUfNGr/6bjgv3Ac59Jvfc2tJLaS+R91sU1Ksnx1zJ/fk3riUGt2qBzf0aaq29S2Qym
         lWqmdRK5wW5t0AdKrV09hOO8BH3XI52pAFugWKIVRfkQeCGNHOBCXIX1Pg98BTOeH/lS
         LB88e05bdnIveAkj6/wiTXrQKgQumoQFOJ9pfZAfXDjhbHKFwYVETtm1G9ri1ZWwH+HK
         p2X3lnGg/1Qx9AETAn2xDcCyWWwoKR157ndpjOam5oBr0bx6tv+MgCASbKYimRK+r+52
         F1lA==
X-Gm-Message-State: APjAAAVBq59drYAzxI7mwB+/OImYpzayv1kqKjYxIfUsSjP7DTxp1GGJ
        fw0wmybuAYrf1PVXBe24gVZ6mw==
X-Google-Smtp-Source: APXvYqz0TaAAJ/YT/CSTJPWpcfSSIRqy1k66k7ROqL3oLI3lJVKdpvUI4kTUQ9kJQo9qVimv3treNQ==
X-Received: by 2002:a17:90a:d585:: with SMTP id v5mr1910474pju.4.1582853117366;
        Thu, 27 Feb 2020 17:25:17 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id r8sm7577529pjo.22.2020.02.27.17.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 17:25:16 -0800 (PST)
Date:   Fri, 28 Feb 2020 10:25:14 +0900
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
Subject: Re: [PATCHv3 01/11] videobuf2: add cache management members
Message-ID: <20200228012514.GL122464@google.com>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
 <20200226111529.180197-2-senozhatsky@chromium.org>
 <3c20606f-5cde-47d3-afd2-d1bbde668136@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c20606f-5cde-47d3-afd2-d1bbde668136@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/27 12:55), Hans Verkuil wrote:
> On 2/26/20 12:15 PM, Sergey Senozhatsky wrote:
> > Extend vb2_buffer and vb2_queue structs with cache management
> > members.
> > 
> > V4L2 UAPI already contains two buffer flags which user-space,
> > supposedly, can use to control buffer cache sync:
> > 
> > - V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
> > - V4L2_BUF_FLAG_NO_CACHE_CLEAN
> > 
> > None of these, however, do anything at the moment. This patch
> > set is intended to change it.
> > 
> > Since user-space cache management hints are supposed to be
> > implemented on a per-buffer basis we need to extend vb2_buffer
> > struct with two new memebers ->need_cache_sync_on_prepare and
> 
> memebers -> members
> 

  meme bears  :)

	-ss
