Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309A3387756
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 13:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244058AbhERLVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 07:21:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:45260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237443AbhERLVH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 07:21:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B4B76117A;
        Tue, 18 May 2021 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621336790;
        bh=5ElBQ67xchsmbI6FU/TuSqPdSTdZKs79VdcdoI+X2Qk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NcnQkouSGOr40R8oAjIaaQTMkWy4YmXpW+fKWnvp0zO9vdTJoZMzxbo4bP3HkxQqk
         p1znWEdUe8PJ9SVPm1vq1ErC2FQkEdw6ymiXFJd7Bw/O0jjq1ig+9lzhmGP9dox2Jx
         awlX5h7cDKxVx7m38i7IGmIdnmv303I8v+HXF118=
Date:   Tue, 18 May 2021 13:19:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jiabing Wan <kael_w@yeah.net>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Align block comments
Message-ID: <YKOi05BwSon+++kq@kroah.com>
References: <20210518111125.87304-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518111125.87304-1-wanjiabing@vivo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 18, 2021 at 07:11:12PM +0800, Wan Jiabing wrote:
> From: Jiabing Wan<kael_w@yeah.net>

Need a space before the "<" character here, and in the signed-off-by
line.

thanks,

greg k-h
