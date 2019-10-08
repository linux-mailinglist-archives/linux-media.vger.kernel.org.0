Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0EAD0415
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 01:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfJHX17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 19:27:59 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44943 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbfJHX17 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 19:27:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id m13so512058ljj.11
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 16:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=r2XrtlPnwB37Sf3FR/Fika8Jyhj3TAKbxeiMwS8qsL8=;
        b=rK+KKWZh66VCDcKOL9C48fZUQMzC7b07PRFl+R51aVXZMnlbDx+1/6qjqvn9B7I0L8
         CtNaQDYoR9Ea9kqWNQjp33KNa2SHok1ITgDClGRgfJ7mzYIU0P5Ir7U3qdy463jM4nSV
         0CSC6A/10pSZk9nWXmn0gq8JNtmsGx4jiRh3TqR5hCN7PSlr5RnAnbQiZUsacKSsXL8H
         1EYwpHRJTFysLCF5bT/gtGVcTCYgvbbqN34Kw9ih+q3pbcRmk+WUdTSOa0fDTBFhD7DB
         Jz3dtINNYdoYD/GzX/jfGUI13ojh7SixQ0IPNADW3jd8Q1Noxs4IWErAKlzhkyfzGnU3
         I/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=r2XrtlPnwB37Sf3FR/Fika8Jyhj3TAKbxeiMwS8qsL8=;
        b=r2bPiVQo2tXFS2fHVpb3TXWUy3eNkz0sZjke5LoDp997jTKQ29zlDOpoAII0F5gHez
         y/lA3F5YEeo9IRusGdLUvhitkWkfJmzkjF+qYNfyNw6RunjyY05VdFqIhMC+t06pS/Ln
         Q0WwnqPzfuUjyUvQi5MoEgsVNGU+el/tVqLmiNorvL1jceVNCtSzD+YT7S2yKEJusGkK
         xBorMh7CHUwTgOaes+n7SLoCvXimwL8YLpLMfwotEZflOFk84lZYHyXVi/dHpgknDOZl
         0ecJS9Ay9uDzgr6X+YvDqzIXppYYwN0gXYiTTIxe+iT9/V+JAId43+V/G+tzt7zQUoGZ
         KnCg==
X-Gm-Message-State: APjAAAVsADu5ARY12X48ii5UxmoX09geQiN5zb9V3fqgBCxgLJ9zEhFs
        ahNoVfNGXBQG4b3TbobUCzbqsg==
X-Google-Smtp-Source: APXvYqzzZX5CXYFAjCyTG/jaDjCXC+MgvKiLmbH8YHM3MxAk3vg/5iUOv0uaASYtz2JyFUS3FQsJhw==
X-Received: by 2002:a2e:2b91:: with SMTP id r17mr424292ljr.1.1570577276905;
        Tue, 08 Oct 2019 16:27:56 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id x17sm34892lji.62.2019.10.08.16.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 16:27:55 -0700 (PDT)
Date:   Wed, 9 Oct 2019 01:27:55 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] rcar-vin: Define which hardware supports NV12
Message-ID: <20191008232755.GX1322@bigcity.dyn.berto.se>
References: <20190906144029.24080-1-niklas.soderlund+renesas@ragnatech.se>
 <20190906144029.24080-2-niklas.soderlund+renesas@ragnatech.se>
 <20190908122059.llolcptapnruy5gj@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190908122059.llolcptapnruy5gj@verge.net.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Simon,

Sorry for missing this mail.

On 2019-09-08 13:20:59 +0100, Simon Horman wrote:
> On Fri, Sep 06, 2019 at 04:40:28PM +0200, Niklas Söderlund wrote:
> > Most but not all Gen3 boards support outputting NV12, add a flag to
> > indicate which boards.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Hi Niklas,
> 
> is this a board or SoC / ES version property ?
> 
> 

This is a SoC property.

-- 
Regards,
Niklas Söderlund
