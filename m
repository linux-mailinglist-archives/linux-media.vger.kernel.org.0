Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1E321423F
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2020 02:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgGDAKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 20:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgGDAKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 20:10:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96C7C061794;
        Fri,  3 Jul 2020 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=7LT+qluJMvgRpzZ6LCW3/hTQL3r7Z5kwA1E+fYUF/cA=; b=VpaqjT5UQ1nflfmlfHwLpvfrCl
        hHdLq22cyyKBQ28ojcSTrjJZzFDTjkgZHiEcHFjP11QMM3IwK/VjbHYzc64fwzzhpy5oa2p6GDEh1
        epSc4hczMSG8+dLB7tmKUBhbD0qhRuyUo6Vjw+At0BIWIdgIIyDHPY/U68JQG/3bmH8UAAONbURWk
        tJ793iVLsWMkLf0wKfPOrB2lcvbZ5HVZIchIeRLHcKwgdZIfOnJuFtCh9ObMc06pXgV8gJlgv+jE4
        Ef/by7bcI7EIlclY5HeZn9ZWZHtDAoxYKxgnfIKBeniYNsqjsQsPnb6e2YDp99AEOZUpkjzGa3W0Y
        7h3TnRWQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrVl4-0002hs-Vx; Sat, 04 Jul 2020 00:10:19 +0000
Date:   Sat, 4 Jul 2020 01:10:18 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 00/11] Documentation: userspace-api/media: eliminate
 duplicated words
Message-ID: <20200704001018.GJ25523@casper.infradead.org>
References: <20200703235536.30416-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703235536.30416-1-rdunlap@infradead.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 03, 2020 at 04:55:25PM -0700, Randy Dunlap wrote:
> Drop all doubled words in Documenation/userspace-api/media/ files.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

(for the series)
