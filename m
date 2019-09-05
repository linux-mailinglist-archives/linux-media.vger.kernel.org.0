Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88208AA399
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 14:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732175AbfIEM5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 08:57:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:56832 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731008AbfIEM5D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 08:57:03 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EB1176EC;
        Thu,  5 Sep 2019 12:57:02 +0000 (UTC)
Date:   Thu, 5 Sep 2019 06:57:01 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
Message-ID: <20190905065701.4744e66a@lwn.net>
In-Reply-To: <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu,  5 Sep 2019 06:23:13 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Python's PEP-263 [1] dictates that an script that needs to default to
> UTF-8 encoding has to follow this rule:
> 
> 	'Python will default to ASCII as standard encoding if no other
> 	 encoding hints are given.
> 
> 	 To define a source code encoding, a magic comment must be placed
> 	 into the source files either as first or second line in the file'

So this is only Python 2, right?  Python 3 is UTF8 by default.  Given that
Python 2 is EOL in January, is this something we should be concerned
about?  Or should we instead be making sure that all the Python we have
in-tree works properly with Python 3 and be done with it?

Thanks,

jon
