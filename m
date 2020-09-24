Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1A0276FC4
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 13:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgIXLWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 07:22:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:49456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgIXLWM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 07:22:12 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB78E2396E;
        Thu, 24 Sep 2020 11:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600946532;
        bh=tSrMjh6Tp12F91iwQGjfztE81iQr93TgUJgtnz2nFkw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bSeH9EaLIUTTpJLk0icANW25BYYnoH9u2e/WtucDsWSrE5G7wiedatFCst+b/UxV6
         s8AnEtvh0fbHz09JedBhw4QnSquf+sWgOPoH0dODQhEz1yzjGEUSjsZ25rsY0swISB
         Fkgm6jUCLCDmmiXnQU1bej48tZ6PGjFHhzVtDsTE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kLPKD-000AES-Fp; Thu, 24 Sep 2020 13:22:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/2] Start supporting builds with Sphinx 3.1+
Date:   Thu, 24 Sep 2020 13:22:03 +0200
Message-Id: <cover.1600945712.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924090230.6f3b0ca1@coco.lan>
References: <20200924090230.6f3b0ca1@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jon,

This is a small patch series with just two patches.

The first one adds support at cdomain.py for two notations found on
Sphinx 3.1:

	:c:expr:
	.. c:namespace::

With that, it should now be possible to use those two C domain
tags at the media documentation, which will make it produce a
decent result with both Sphinx 1.x/2.x and Sphinx 3.1+.

The second patch manually changes the CEC documentation in
order for it to use those macros, instead of relying at the original
cdomain extensions.

I tested building the docs with both Sphinx 2.4.4 and 3.2.1.
They are identical, except by a minor difference:  the output of
:c:expr: uses a bold monospaced font with 3.1+, while it uses a
non-bold monospaced font with older versions.

Yet, the output looks decent on both versions.

I'm planning to use the same approach on all the other documents
under userspace-api/media. So, I guess it would be easier if
I could merge both the cdomain.py and the media patches via
the media tree, if this is ok for you.

-

With regards to patch 1, I tried first to use a hook at 'doctree-resolved',
just like the automarkup.py, but that is too late for  changing the
namespace. So, I ended hooking the extra logic at 'source-read'.

I suspect that this could be implemented on some other ways, but
this can be optimized later on, if needed.

Mauro Carvalho Chehab (2):
  docs: cdomain.py: add support for two new Sphinx 3.1+ tags
  media: docs: make CEC documents compatible with Sphinx 3.1+

 Documentation/sphinx/cdomain.py               | 56 ++++++++++++++++++-
 .../media/cec/cec-func-close.rst              |  7 ++-
 .../media/cec/cec-func-ioctl.rst              |  7 ++-
 .../userspace-api/media/cec/cec-func-open.rst |  7 ++-
 .../userspace-api/media/cec/cec-func-poll.rst | 11 ++--
 .../media/cec/cec-ioc-adap-g-caps.rst         |  9 ++-
 .../media/cec/cec-ioc-adap-g-conn-info.rst    | 11 ++--
 .../media/cec/cec-ioc-adap-g-log-addrs.rst    | 14 +++--
 .../media/cec/cec-ioc-adap-g-phys-addr.rst    | 14 +++--
 .../media/cec/cec-ioc-dqevent.rst             |  9 ++-
 .../media/cec/cec-ioc-g-mode.rst              | 14 +++--
 .../media/cec/cec-ioc-receive.rst             | 14 +++--
 12 files changed, 128 insertions(+), 45 deletions(-)

-- 
2.26.2


