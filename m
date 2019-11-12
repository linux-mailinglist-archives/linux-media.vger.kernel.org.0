Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9D1F99AB
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 20:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfKLTYN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 14:24:13 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41684 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfKLTYN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 14:24:13 -0500
Received: by mail-oi1-f193.google.com with SMTP id e9so15900041oif.8;
        Tue, 12 Nov 2019 11:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nHKniHr/jrTqcqTvuwayO8CQswwkt5HhgPD/t+rz310=;
        b=XRYilXlNchyrIEUhle0rrCnAgaXTy1vxxMyhwRwL7bRSIXZmB/+1etjudpVyL/hyyu
         MwOkTk0sZNHqx7Yvy3N9NT3N2We0D5ua6F4eb4YVgw9f8beH9l/eASx0NLLDPzOTZPUX
         6R5gLO5pboDuwe32ZX6bVdRlzY6yihKdHOW5TNhFgBphg7jiXhOnRGQnJkvw8PG+rAnO
         2dyTS5gSHuFqTG67dDQi5qzyziN8yfH11L8ttotPRzAMjcckAFrSXJWmnf9TqmdKfXnL
         KPGiTGZ/IBeYNXVbFqPQv8o0PIkSU03IGIjlYmG3JIeUZ0T0/cwby6fHe44Wf3jcKU7I
         Bt6g==
X-Gm-Message-State: APjAAAX7uzX+Ms5XNE1/PJ1ChdfWI/5XzBiWUF76M9blMsf8kizThECa
        qDUsglTgz14qJoSq5JZHEw==
X-Google-Smtp-Source: APXvYqzDhHELSIA3q/SvAE8lTdDKpxmRN4Mt7JzpZClIV/GtCVHuBkOChbDHzxBeESPjODDu6vhzdQ==
X-Received: by 2002:a54:4898:: with SMTP id r24mr475150oic.143.1573586651439;
        Tue, 12 Nov 2019 11:24:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c15sm6729095otk.12.2019.11.12.11.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:24:11 -0800 (PST)
Date:   Tue, 12 Nov 2019 13:24:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, Jacopo Mondi <jacopo@jmondi.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 03/11] dt-bindings: video-interface: Expand rotation
 description
Message-ID: <20191112192410.GA14553@bogus>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
 <20191108155944.1040883-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108155944.1040883-4-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri,  8 Nov 2019 16:59:36 +0100, Jacopo Mondi wrote:
> Expand the 'rotation' property description to define the direction and
> orientation of the axis around which the device mounting rotation is
> expressed.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt        | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
