Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12070277725
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 18:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgIXQrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 12:47:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:51556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgIXQrw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 12:47:52 -0400
Received: from coco.lan (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1250322208;
        Thu, 24 Sep 2020 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600966072;
        bh=DXiLMHL6N2+tW6apsxPze3MC/csk7rUk3NfNeQZtNPE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RAgcFfEYT0gCnZKyGd5uCGgauEuasZzCZnrZCKOgPKvgIPrRfINviUHxByE9nwb/R
         ebUoMh9a8VE3hKViRNNhZI2Be7mPT9sYg/Fooyj+pogGZy7JQQRR81X5QSXsaPI/A0
         DrJqAD9tSJ8RRul1SQMvBxjTllVL4L+QX4B+kRRc=
Date:   Thu, 24 Sep 2020 18:47:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: docs: make CEC documents compatible with
 Sphinx 3.1+
Message-ID: <20200924184746.2ee13f1e@coco.lan>
In-Reply-To: <20200924102516.5793f792@lwn.net>
References: <cover.1600963096.git.mchehab+huawei@kernel.org>
        <4dce88f0cb555c79f71006bf9e62e209144762bb.1600963096.git.mchehab+huawei@kernel.org>
        <20200924102516.5793f792@lwn.net>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 24 Sep 2020 10:25:16 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Thu, 24 Sep 2020 18:21:46 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > -:c:func:`close() <cec-close>` returns 0 on success. On error, -1 is returned, and
> > +:c:func:`close()` returns 0 on success. On error, -1 is returned, and  
> 
> So while you're at it, it seems like all the :c:func: markups could come
> out, right?

Hmm... I guess not :-)

I mean, we could rely on automarkup.py in order to automatically do
that. However, right now automarkup skips the systemcalls/libc functions
that this patchset touches:

	Skipfuncs = [ 'open', 'close', 'read', 'write', 'fcntl', 'mmap',
	              'select', 'poll', 'fork', 'execve', 'clone', 'ioctl',
        	      'socket' ]

One day, once namespace is set properly for all subsystems, we could
drop Skipfunctions from automarkup and cleanup those manual markups,
but for now this is still needed.

Thanks,
Mauro
