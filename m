Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F629124C39
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 16:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfLRPwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 10:52:14 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43429 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbfLRPwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 10:52:14 -0500
Received: by mail-lj1-f196.google.com with SMTP id a13so2682167ljm.10
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9SaCbmKz1ngtAKjewhoah2l6ODU7+VciCnZ7nlhe26A=;
        b=KDdHHJJR0qVpHZqAH81m6HqiNucHS6+DyOVljs3zJhGM2FtVdbdAm0v2Xxx2kkMzcc
         COndoaW+YFAjiesHFNY+QGvBhkVduyh7QLCQeLwcNzFcgoRSyGgSLcKxln6/f1EUD6yP
         0y/6+ZumAIbzC9iZaVPFSydS1BkjYoeUFSafS/fB2OWFlpyQaG5ZPEXYvAMbIqCKuFSL
         vWtk3rEHKc5uyahuOPC2nUQfw14PqKcbFsQXhuikgf46s/H3eDyiCMpavZwnwbAsy3mj
         YXZ/SZZpNe1V4549MQIslp0gnIgv8CLO8jjGejFKXWpzPMIfXWxDiYo5N9hhWPoVV8yK
         Z+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9SaCbmKz1ngtAKjewhoah2l6ODU7+VciCnZ7nlhe26A=;
        b=H9xXBZhzxU+TB6fmPBpK0LX4GV8HEi3maNpq2fb8MGz3ydoewc9zMP3L8UhzoMIIfm
         vFD5pHaIzbXoUWAlXRcNYK3V96N2gW5g0LLMkAah+MLNPsWcOk1I0EPfm9mEQ9XBnUGr
         rne1xVpjtmkXKfVD06HttXYvEwRPoHAEpTi8FKiyDyPLVxn7crgvM7yoDY/PVvItbrUE
         zFCHFw/2qnraEvTRRLlXcs0rTTHK18tkolG0bXuI13p92OexIIQluwpfdZzgza9+/GBP
         9CSxkPirEpDMn3bcUYQULcFsiba+G+fv2LiJxqAFzOgKnQOsHHSlI2MQswcV1tH8TvnV
         FxSw==
X-Gm-Message-State: APjAAAX1Pq9NY3SJfdPpDbQAtdY1moEPdbcgKJ6c5i2JQLjJDCqUQUFg
        xqveeCKRd/HidFcEPqKdOEbxbQ==
X-Google-Smtp-Source: APXvYqwSmzkDxFfUqfRx+ol+ctreHSER3AZEkxHGbqQ5sNtLr5I/0+mwtD90Owb4uveY0c44Ujy5Kw==
X-Received: by 2002:a2e:3312:: with SMTP id d18mr2333248ljc.222.1576684332255;
        Wed, 18 Dec 2019 07:52:12 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id s16sm1351312lfc.35.2019.12.18.07.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 07:52:11 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id 66C2E1012CF; Wed, 18 Dec 2019 18:52:11 +0300 (+03)
Date:   Wed, 18 Dec 2019 18:52:11 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v11 01/25] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191218155211.emcegdp5uqgorfwe@box>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216222537.491123-2-jhubbard@nvidia.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 16, 2019 at 02:25:13PM -0800, John Hubbard wrote:
> +static void put_compound_head(struct page *page, int refs)
> +{
> +	/* Do a get_page() first, in case refs == page->_refcount */
> +	get_page(page);
> +	page_ref_sub(page, refs);
> +	put_page(page);
> +}

It's not terribly efficient. Maybe something like:

	VM_BUG_ON_PAGE(page_ref_count(page) < ref, page);
	if (refs > 2)
		page_ref_sub(page, refs - 1);
	put_page(page);

?

-- 
 Kirill A. Shutemov
