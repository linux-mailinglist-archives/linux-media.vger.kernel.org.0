Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EECC4554B9
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 07:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243327AbhKRGYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 01:24:08 -0500
Received: from smtprelay0235.hostedemail.com ([216.40.44.235]:45970 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229786AbhKRGYE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 01:24:04 -0500
Received: from omf13.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id B8DEB87CB7;
        Thu, 18 Nov 2021 06:21:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id 9841F2000267;
        Thu, 18 Nov 2021 06:20:55 +0000 (UTC)
Message-ID: <cec5c6cf048eacec2c8204b99c5708996fa9f178.camel@perches.com>
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 17 Nov 2021 22:21:00 -0800
In-Reply-To: <20211118061418.GO26989@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
         <20211114222353.22435-2-digetx@gmail.com>
         <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
         <20211115124402.GE26989@kadam>
         <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
         <20211115154858.GG27562@kadam>
         <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
         <20211118061418.GO26989@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9841F2000267
X-Spam-Status: No, score=1.39
X-Stat-Signature: 8kqammgfhwcnnqfwjc8duj68xspb51yo
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+OSmK8mQAhbe4KvTJ9/kWsrKhlkfyqzyw=
X-HE-Tag: 1637216455-502629
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-11-18 at 09:14 +0300, Dan Carpenter wrote:
> It's not hard to run Smatch yourself...
> 
> Depending on if you're on a apt distro or yum distro then fetch the
> dependencies with one of the follow commands:
> apt-get install gcc make sqlite3 libsqlite3-dev libdbd-sqlite3-perl libssl-dev libtry-tiny-perl
> yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny
> 
> git clone https://github.com/error27/smatch
> cd smatch
> make
> cd ~/kernel_source/
> ~/smatch/smatch_scripts/kchecker drivers/subsystem/

Might want to stick something in Documentation about that.

