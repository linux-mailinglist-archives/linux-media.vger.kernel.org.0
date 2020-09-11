Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F080265D66
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 12:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbgIKKJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 06:09:22 -0400
Received: from verein.lst.de ([213.95.11.211]:36343 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgIKKJW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 06:09:22 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id DB5CF68B02; Fri, 11 Sep 2020 12:09:19 +0200 (CEST)
Date:   Fri, 11 Sep 2020 12:09:19 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT flag
Message-ID: <20200911100919.GA1945@lst.de>
References: <20200911030758.73745-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911030758.73745-1-sergey.senozhatsky@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Btw, the subject should probably read something like:

media/v4l2: remove the V4L2_FLAG_MEMORY_NON_CONSISTENT flag

I messed up the spelling because I copied it from the documentation.
