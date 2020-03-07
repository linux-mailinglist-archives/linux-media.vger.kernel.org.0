Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2485A17CCC7
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 09:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgCGIJf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 03:09:35 -0500
Received: from mail-pl1-f181.google.com ([209.85.214.181]:34828 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgCGIJf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 03:09:35 -0500
Received: by mail-pl1-f181.google.com with SMTP id g6so1857485plt.2
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2020 00:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Il0BuirtXElX3OhJ8KQ+VVPD82PshE9sC+bGdFWDsGU=;
        b=Y6x+ktQYKlOTGiFoCpzmgJHyWqjxMCmMqSAxY4SB8JzMC5JWisoxpp7cHnfLHFX5OT
         qQIk8bBOtAsU0XfsP37BubttZaRh1tZPPYyBEVOCVfznu+iSOQxvl6ksS5n/GJrr4Hr2
         B87D5TVYJ+RAA2v2G8kT63cJd9bRecv1Ue+6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Il0BuirtXElX3OhJ8KQ+VVPD82PshE9sC+bGdFWDsGU=;
        b=T5+CALRwawU1tk3Qa9GOPEnxSRZT0eMhFqA35sx4mT35RMAPxD1BdImoqSeRm/3adP
         99nnF+WQllJ6Q2AGoq2ijKznJxaisWuely0kZYiuJI/VPic5zu6MgbA43KrDCVkHduvx
         vx8Ui3NwKkRpKP6Pq2Cv3xaYM7M/XtgJoOw25TlcqblJnuPTV3aRUSyMYgfkAdMCm7bB
         bagytqsNJucutY9FN7vM1QEE7zxC9r9s+o+RpzZq2ENAjqJyTlIXD2ustHGP6FTF97BG
         zIMItKU+dGkCf1oUFJU3bxP2KvIhvbZzLW0Ok0V2nh0YPXxPvRxdxBJxASe5Am+DwMnK
         0svQ==
X-Gm-Message-State: ANhLgQ1b4Fg3QgoIvv2vyeZLsxnR6RYrRr8KERWwDJej4ZvgU1Msa4r2
        qUjclRRliP9Qe/rO+JHNBAJYjQ==
X-Google-Smtp-Source: ADFU+vstyaUZAA30a7Gyv0ev+TGK+vA0QMq+YD9kZGE7d7/4+YCQfrphuGxCCpOOwROkghJ9eGxANg==
X-Received: by 2002:a17:90a:1ae9:: with SMTP id p96mr7809803pjp.123.1583568574186;
        Sat, 07 Mar 2020 00:09:34 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id x9sm7359744pfa.188.2020.03.07.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 00:09:33 -0800 (PST)
Date:   Sat, 7 Mar 2020 17:09:32 +0900
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
Subject: Re: [PATCHv4 03/11] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT
 flag
Message-ID: <20200307080932.GF176460@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-4-senozhatsky@chromium.org>
 <40b1cc23-5e28-837b-49d5-e32d9dd3edee@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40b1cc23-5e28-837b-49d5-e32d9dd3edee@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/06 14:58), Hans Verkuil wrote:
> 
> Please fold that in this patch.
> 

Thanks!

	-ss
