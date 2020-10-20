Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A5A287472
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 14:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgJHMlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 08:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730062AbgJHMlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 08:41:51 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9014BC0613D4
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 05:41:51 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n9so4176763pgf.9
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2020 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=urluBRAZhemlAGNYR9JHz7//XtKVwD7KOsOnuK3XEvE=;
        b=i93YgqfP2Qs8dlAx7dyQ+W0IRG7pAxhJwW9+eRHcvMVYP3djMki+CGM6zO0EVJGk6K
         IbQzLSWJO3N1l0EX9JrKSfHEa7utNqIB47jME7UstUYw4VjXJ3eqfisu2Lv5k6vC2Rji
         RXYD2ZA+lWznWQWoRqSMqejEaxBGkz94802iEmzJd0MCBP2cDlv790XzP6x1cW1hFd/9
         VynwcCRsd9uDLYGf7l4gaVrI2jMIq7IhzjCPA4DTCHUEEBJWY9srCgIimdgBAYkzeSSZ
         OrD77ImZWUgTRcr1HoKIi9uUAfbiDRf/QR54E/fTvbFXgKqiTQNN+jJNb/teyHBDz9PA
         L6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=urluBRAZhemlAGNYR9JHz7//XtKVwD7KOsOnuK3XEvE=;
        b=ANAeMGGklqy/S4vm04+GJtIeFCYAEStwrKDFTNVrm15Rxsn74IRz2oIFWoA53+aUoe
         lqQEtfz/v8QdmYing2NZbVo5AaKwGkuywwNuY+2uKcMSFnqbkTFQXZv62z0I/rBX0/wu
         OeJTouAIa+fNNltvkrChxOKpcUiJA5CJGf+H0nEcgqbH1ryE6boD0IcnfkG3DYATrYrV
         o6zTMVKCB3JGX9PCFdwptFIiG8OPBRST5iCueMIJx4/PFEJ7Nk13utmXgvxYK3LWaIg7
         DdQJhAyweXGkUD4tiHxrsahYE4UlovLyWi9z3leDVflf38H/Xp7Uzcjuf53Q9iJmw8q1
         tpvw==
X-Gm-Message-State: AOAM531yTOLHYZMjqeceb5sQ8YGf/BDDx9U+vTtcuZebIUR8ZfA7oVtB
        f+GfsFzapLdeHlIbvKE4bXfTfA==
X-Google-Smtp-Source: ABdhPJxnQ64uysYsu/F9BjeJkE2gf+57wvTrXl8yFyGGP/X1izZlhvOyXG/ViriTgaaOJPI9vrc0XQ==
X-Received: by 2002:a17:90a:6787:: with SMTP id o7mr8072496pjj.125.1602160910911;
        Thu, 08 Oct 2020 05:41:50 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id k11sm7411830pjs.18.2020.10.08.05.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 05:41:49 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQVEx-001U2l-UT; Thu, 08 Oct 2020 09:41:47 -0300
Date:   Thu, 8 Oct 2020 09:41:47 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
Message-ID: <20201008124147.GD5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
 <20201007232448.GC5177@ziepe.ca>
 <CAPcyv4jA9fe40r_2SfrCtOaeE85V88TA3NNQZOmQMNj=MdsPyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4jA9fe40r_2SfrCtOaeE85V88TA3NNQZOmQMNj=MdsPyw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 08, 2020 at 12:49:54AM -0700, Dan Williams wrote:

> > This is what got me thinking maybe this needs to be a bit bigger
> > generic infrastructure - eg enter this scheme from fops mmap and
> > everything else is in mm/user_iomem.c
> 
> It still requires every file that can map physical memory to have its
> ->open fop do

Common infrastructure would have to create a dummy struct file at mmap
time with the global inode and attach that to the VMA.

Jason
