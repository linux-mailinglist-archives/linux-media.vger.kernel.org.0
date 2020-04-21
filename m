Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3356D1B2641
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 14:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgDUMin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 08:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728285AbgDUMim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 08:38:42 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A8EC061A10
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 05:38:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id b11so16266862wrs.6
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 05:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dEtMSnugQ0Yz8dEGP0UAZ0gmicmpiHlS1EX56QRmSxU=;
        b=CBU1r5Bh/z0btpExs9JQcV1xmQKPX8pt2qs5S2PKDBCXn+8oq/3Zit1BDOlY7ZtHVB
         ZCt35gvpxp/b8ZMio6jsNpYxm9V49VDog66VLWJzup6N0BP23SIeZGpN1PNnbePNh3t/
         9wA20fyU9sIL6UZfl+s7XPNkO7+Nuxq4JbL00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dEtMSnugQ0Yz8dEGP0UAZ0gmicmpiHlS1EX56QRmSxU=;
        b=D+kA0epNUnHGfCkpzZ5BOLUgjHZmk6u6Oq39IjaW7qp/iGZf2bMCEXnNA07P7QYQ3n
         1+jjGKBI482kv0arO2CkaS10+fb3BCwesSZUeKavcn3yCCzj9lN2qNuL1tDb+CgGzypo
         YSi7X7q8R4yb7qju+0eHX2J2zziQx5mO9RTq+CuWiV/M8z029whPiUYwk4KQLSv4uFIq
         kHBIpeUKp6ekkeSKF2c026D86Csq4nitnWBIBjbqDPz36U/c+R/DcTFxvN6s0szYCVQE
         pvKfCkrYjnKmoichy6qg3T2lr+FFQoQbUHU8ZXJq42049/rLW7OGZi9oKfWenzUQ8U8f
         Rq4w==
X-Gm-Message-State: AGi0PuZsQdzOzGrpHzmMQxNr1ZZMApE/JlkoxJSyNhpfE5OSXtK4DqTA
        1Ogyj5qSfRVBtzbMGdCdpaXe3w==
X-Google-Smtp-Source: APiQypIzvmkA09MwByYqroH0B7xqF5CSvHdVyYFGv6atnXmAXLQdkPPxOvWpKImiQh189bdrvWfWOA==
X-Received: by 2002:a05:6000:10c4:: with SMTP id b4mr3232873wrx.203.1587472719979;
        Tue, 21 Apr 2020 05:38:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k3sm4000288wru.90.2020.04.21.05.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 05:38:39 -0700 (PDT)
Date:   Tue, 21 Apr 2020 14:38:37 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Gal Pressman <galpress@amazon.com>, linux-doc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Couple of documentation typo fixes
Message-ID: <20200421123837.GZ3456981@phenom.ffwll.local>
References: <20200420074115.23931-1-galpress@amazon.com>
 <20200420170059.5a42693e@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420170059.5a42693e@lwn.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 20, 2020 at 05:00:59PM -0600, Jonathan Corbet wrote:
> On Mon, 20 Apr 2020 10:41:15 +0300
> Gal Pressman <galpress@amazon.com> wrote:
> 
> > Fix a couple of typos: "as" -> "has" and "int" -> "in".
> > 
> > Signed-off-by: Gal Pressman <galpress@amazon.com>
> 
> Applied, thanks.

Also applied to drm-misc-next, the dma-buf stuff is maintained as part of
drm. And maybe I actually get around to doing the doc polish for all
things dma-buf that I've been promised to do since months :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
