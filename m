Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B698CAAC1E
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 21:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390837AbfIETkL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 15:40:11 -0400
Received: from ms.lwn.net ([45.79.88.28]:58484 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388174AbfIETkK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 15:40:10 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CF9407DA;
        Thu,  5 Sep 2019 19:40:09 +0000 (UTC)
Date:   Thu, 5 Sep 2019 13:40:08 -0600
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
Message-ID: <20190905134008.57cd3e89@lwn.net>
In-Reply-To: <20190905162810.2388d532@coco.lan>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
        <20190905065701.4744e66a@lwn.net>
        <20190905162810.2388d532@coco.lan>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 5 Sep 2019 16:28:10 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> I don't think we can count that python 3 uses utf-8 per default.
> 
> I strongly suspect that, if one uses a Python3 version < 3.7, it will
> still default to ASCII.
> 
> On a quick look, the new UTF-8 mode was added on PEP-540:
> 
> 	https://www.python.org/dev/peps/pep-0540/
> 
> Such change happened at Python 3.7. 

That PEP is to override the locale and use utf8 unconditionally.  It
says, with regard to the pre-PEP state:

	UTF-8 is also the default encoding of Python scripts, XML and JSON
	file formats.

Unicode was the reason for much of the Python 3 pain; it seems unlikely
that many installations are defaulting to ASCII anyway...?

jon
