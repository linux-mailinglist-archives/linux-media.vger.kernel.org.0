Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D532D61F2
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 17:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389090AbgLJQFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 11:05:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:33716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387551AbgLJQEv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 11:04:51 -0500
Date:   Thu, 10 Dec 2020 17:03:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607616222;
        bh=Mtl6RgPMNU4L2bclllW7GySGPqjLTPkI7O0IFKCuac0=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=RY9C0+WHegg0Xw+VWDfjqFJMVS+PrDkR6451btUWZxHGBiR9E/B6f0Xec0Mm1DSED
         nMOVNThN+w0kL2/3hhv/PSXhTjDbRsFpJGNe14YUzzbIWeiIjsgDKmxM/Yi4V0iBuQ
         mUPLvAAwy0ehR19CfUoEEkCWL9FMMIqgqCVZp7FeOmifXkq2NeU5fLi1p5mJ9Adr4a
         nv+iVfPhVdXqRxrYd9i12a6P0mwxB7OVQHcJyUi6qzwFCZgz879pchoF82Ztzk8+bt
         EQL8wElrpgk+mJ/yvokPIJXuZ87sgrfpAZiVD8lApgeV/E8jncfsRoKT2wI80JLXgL
         6DqSUjxGCkNZA==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] docs: conf.py: fix sphinx version detection for
 margin set
Message-ID: <20201210170336.7506766a@coco.lan>
In-Reply-To: <20201210074845.4eb67f22@lwn.net>
References: <cover.1607597287.git.mchehab+huawei@kernel.org>
        <0e610cbb57e85864b23d2b8fffa65c6b137daaac.1607597287.git.mchehab+huawei@kernel.org>
        <20201210074845.4eb67f22@lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 10 Dec 2020 07:48:45 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Thu, 10 Dec 2020 11:55:40 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The PDF generator has a logic to detect the proper way to
> > setup the page margins. By default, the page has about
> > 14.8 cm, which is too short to display some tables and literal
> > blocks. So, previous patches changed it to be around 17.5 cm,
> > but the logic only works with Sphinx version 1.x.x.
> > 
> > Fix it.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Acked-by: Jonathan Corbet <corbet@lwn.net>
> 
> Feel free to route this one with the rest of the set.
> 
> Someday it might be nice to isolate all of the latex stuff into
> conf-latex.py or some such so most of us don't have to look at it..:)

Yeah, makes sense.

Btw, just gave another trial of rst2pdf (sent the RFC patch
adding support for it)...


Still doesn't work: lots of documents are produced with
zero size :-(


Thanks,
Mauro
