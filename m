Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAF027972B
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 07:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIZF5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 01:57:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgIZF5H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 01:57:07 -0400
Received: from coco.lan (ip5f5ad5c1.dynamic.kabel-deutschland.de [95.90.213.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC82820809;
        Sat, 26 Sep 2020 05:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601099826;
        bh=VpCCvy+EKz11t+tlGoIB2j+LPqNVuV+DnNFwkVqi0iw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m+DYDymX9ui8HRZXH9UlwsXgr3dhQKiCW2DF2byZESLRu0HdmykRuZorexpxqyHu0
         giICo7rVre5d7CbpxDZQsjIENDXnPwv9wFX+/G+CylEvNECyHXKx5kG79BcPT0sVsW
         7W3kPUPZ/36v+7wfzhV+sG1Q1C6d75w83qROpGNM=
Date:   Sat, 26 Sep 2020 07:57:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: [git:media_tree/fixes] media: media/v4l2: remove
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Message-ID: <20200926075702.6e1fbe2a@coco.lan>
In-Reply-To: <20200922134235.GA22620@lst.de>
References: <E1kHoRT-009OMF-AW@www.linuxtv.org>
        <20200922134235.GA22620@lst.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph,

Em Tue, 22 Sep 2020 15:42:35 +0200
Christoph Hellwig <hch@lst.de> escreveu:

> On Mon, Sep 14, 2020 at 01:28:06PM +0000, Mauro Carvalho Chehab wrote:
> > This is an automatic generated email to let you know that the following patch were queued:  
> 
> did you intend to get this into Linus tree before 5.9?  I just checked
> and didn't see it in mainline yet.

It was merged upstream on Thursday:

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8fa5960f575995bc8f3beb6b36c5aa6c61e7cdc0

Regards,
Mauro
